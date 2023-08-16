import 'package:cognivoice/models/audioProcessingResult.model.dart';
import 'package:cognivoice/services/postAudio.service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:io';

class Work extends StatefulWidget {
  const Work({super.key, required this.context});

  final BuildContext context;

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    audioRecord.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text('CogniVoice'),
        elevation: 1,
        shadowColor: Colors.black12,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
      ),
      body: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            if (statusCode > 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Status Code: ',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    statusCode.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: statusCode == 200
                          ? Colors.green[700]
                          : Colors.red[500],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            if (!isRecording)
              Column(
                children: [
                  const SizedBox(height: 32),
                  if (response == "Loading...")
                    CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  if (response != "Waiting..." || response != "Loading...")
                    Text(
                      response,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  const SizedBox(height: 16),
                ],
              ),
            const SizedBox(height: 32),
            if (isRecording)
              Column(
                children: [
                  Text(
                    'Recording...',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: isRecording ? stopRecording : startRecording,
                  icon: Icon(isRecording ? Icons.stop : Icons.mic),
                  label: Text(
                    isRecording ? 'Stop Recording' : 'Start Recording',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            if (!isRecording && audioPath.isNotEmpty)
              Column(
                children: [
                  if (isPlaying) const Text('Playing...'),
                  if (!isPlaying)
                    ElevatedButton.icon(
                      onPressed: playRecording,
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Play Recording'),
                    ),
                  ElevatedButton.icon(
                    onPressed: processAudio,
                    label: const Text('Process Recording'),
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  final Record audioRecord = Record();
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isRecording = false;
  String audioPath = "";
  bool isPlaying = false;
  String response = "Waiting...";
  int statusCode = 0;

  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        await audioRecord.start();
        setState(() {
          isRecording = true;
          response = "Waiting...";
        });
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<void> stopRecording() async {
    try {
      String? path = await audioRecord.stop();

      setState(() {
        isRecording = false;
        audioPath = path!;
      });
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<void> playRecording() async {
    if (audioPath.isNotEmpty) {
      try {
        if (audioPath.isNotEmpty) {
          Source urlSource = UrlSource(audioPath);
          await audioPlayer.play(urlSource);
          setState(() {
            isPlaying = true;
          });

          audioPlayer.onPlayerComplete.listen((event) {
            setState(() {
              isPlaying = false;
            });
          });
        }
      } catch (e) {
        throw Exception("Error: $e");
      }
    } else {
      throw Exception("Error: No audio file to play");
    }
  }

  Future<void> processAudio() async {
    AudioProcessingResult postResponse = await postAudio(audioPath);
    String audioBase64 = postResponse.audio;
    File? receivedAudio = await decodeAudio(audioBase64);

    setState(() {
      response = postResponse.message;
      statusCode = postResponse.statusCode;
      audioPath = receivedAudio.path;
    });
  }
}

Future<File> decodeAudio(String audioBase64) async {
  final Uint8List audioBytes = base64.decode(audioBase64);
  final Directory tempDir = await getTemporaryDirectory();
  final File tempFile = File('${tempDir.path}/audio.m4a');

  await tempFile.writeAsBytes(audioBytes);

  return tempFile;
}

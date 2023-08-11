import 'package:cognivoice/utils/convertAudio.util.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:record/record.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Record audioRecord = Record();
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isRecording = false;
  String audioPath = "";
  bool isPlaying = false;
  String response = "Waiting...";

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
  }

  Future<void> postAudio() async {
    debugPrint("\nPosting audio...\n");

    setState(() {
      this.response = "Loading...";
    });

    String apiUrl = "http://10.128.69.29:3001/";

    String audioFilePath = audioPath;
    String flacFilePath = await convertAudio(audioFilePath, 'm4a', 'flac');
    File flacFile = File(flacFilePath);
    List<int> flacBytes = await flacFile.readAsBytes();

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "audio/flac",
      },
      body: flacBytes,
    );

    final jsonResponse = json.decode(response.body);

    final String message = jsonResponse['message'];

    if (response.statusCode == 200) {
      final String base64Audio = jsonResponse['audio'];

      Uint8List bytes = base64Decode(base64Audio);
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      String tempFilePath = "$tempPath/temp.flac";
      File tempFile = File(tempFilePath);
      await tempFile.writeAsBytes(bytes);

      setState(() {
        this.response = message;
        this.audioPath = tempFilePath;
      });

      playRecording();
    } else {
      setState(() {
        this.response = message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('CogniVoice'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Visibility(
              visible: !isRecording,
              child: Column(
                children: [
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
            ),
            // spacer
            const SizedBox(
              height: 32,
            ),
            if (isRecording) const Text('Recording...'),
            ListTile(
              title: Text(isRecording ? 'Stop Recording' : 'Start Recording'),
              leading: Icon(isRecording ? Icons.stop : Icons.mic),
              onTap: isRecording ? stopRecording : startRecording,
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
                    onPressed: postAudio,
                    label: const Text('Process Recording'),
                    icon: const Icon(Icons.send),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}

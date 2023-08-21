import 'package:cognivoice/models/audioProcessingResult.model.dart';
import 'package:cognivoice/providers/user.provider.dart';
import 'package:cognivoice/services/audio.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'dart:io';

enum TimeOfDay {
  morning,
  afternoon,
  night,
}

class Work extends ConsumerStatefulWidget {
  const Work({super.key, required this.context, required this.ref});

  final BuildContext context;
  final WidgetRef ref;

  @override
  _WorkState createState() => _WorkState();
}

class _WorkState extends ConsumerState<Work> {
  @override
  Widget build(BuildContext context) {
    user = ref.read(userProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          // physics: const BouncingScrollPhysics(),
          // padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(
              height: 72,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Good ${timeOfDay.toString().split('.').last}!",
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headlineSmall!.fontSize,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )),
                  Text("Search with CogniVoice",
                      style: Theme.of(context).textTheme.bodyLarge,
                      softWrap: true),
                ]),
                IconButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/login'),
                    icon: Icon(
                      Icons.settings_outlined,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ))
              ],
            ),
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

  final AudioService audioService = AudioService();
  final Record audioRecord = Record();
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isRecording = false;
  String audioPath = "";
  bool isPlaying = false;
  String response = "Waiting...";
  int statusCode = 0;
  late User user;
  late TimeOfDay timeOfDay;

  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        await audioRecord.start();
        setState(() {
          isRecording = true;
          response = "Waiting...";
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'You must allow audio recording to use this feature',
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'You must allow audio recording to use this feature',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
        ),
      );
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
    AudioProcessingResult postResponse =
        await audioService.postAudio(audioPath, user.selectedMode);
    String audioBase64 = postResponse.audio;
    File? receivedAudio = await audioService.decodeAudio(audioBase64);

    setState(() {
      response = postResponse.message;
      statusCode = postResponse.statusCode;
      audioPath = receivedAudio.path;
    });
  }

  @override
  void initState() {
    // get time of day
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 5 && hour < 12) {
      timeOfDay = TimeOfDay.morning;
    } else if (hour >= 12 && hour < 18) {
      timeOfDay = TimeOfDay.afternoon;
    } else {
      timeOfDay = TimeOfDay.night;
    }

    super.initState();
  }

  @override
  void dispose() {
    audioRecord.dispose();
    audioPlayer.dispose();
    super.dispose();
  }
}

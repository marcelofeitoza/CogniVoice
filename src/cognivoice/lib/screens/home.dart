import 'package:cognivoice/models/audioProcessingResult.model.dart';
import 'package:cognivoice/providers/user.provider.dart';
import 'package:cognivoice/services/audio.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:loggerw/loggerw.dart';
import 'package:record/record.dart';
import 'dart:io';

enum TimeOfDay {
  morning,
  afternoon,
  night,
}

class Home extends ConsumerStatefulWidget {
  const Home(
      {Key? key,
      required this.context,
      required this.ref,
      required this.logger})
      : super(key: key);

  final BuildContext context;
  final WidgetRef ref;
  final Logger logger;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
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
                  onPressed: () {
                    widget.logger.i("Home: Settings button clicked");
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  icon: Icon(
                    Icons.settings_outlined,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                // user details
                const SizedBox(height: 32),
                Row(
                  children: [
                    Text(
                      'Name: ',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      user.email,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Mode: ',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      user.selectedMode,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48,
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
                  onPressed: () =>
                      isRecording ? stopRecording() : startRecording(),
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
    widget.logger.i("Home: Start recording");

    try {
      if (await audioRecord.hasPermission()) {
        widget.logger.i("Home: Has permission to record audio");

        await audioRecord.start();
        setState(() {
          isRecording = true;
          response = "Waiting...";
        });
      } else {
        widget.logger.e("Home: Audio recording permission not granted");
      }
    } catch (e) {
      widget.logger.e("Home: Error while starting recording - $e");
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
      widget.logger.e("Home: Error while stopping recording - $e");
    }
  }

  Future<void> playRecording() async {
    if (audioPath.isNotEmpty) {
      try {
        widget.logger.i("Home: Playing recording from path: $audioPath");

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
      } catch (e) {
        widget.logger.e("Home: Error while playing recording - $e");
      }
    } else {
      widget.logger.e("Home: No audio file to play");
    }
  }

  Future<void> processAudio() async {
    try {
      widget.logger.i("Home: Processing audio");

      AudioProcessingResult postResponse = await audioService.postAudio(
          audioPath, widget.logger, user.selectedMode);

      String audioBase64 = postResponse.audio;
      File? receivedAudio =
          await audioService.decodeAudio(audioBase64, widget.logger);

      setState(() {
        response = postResponse.message;
        statusCode = postResponse.statusCode;
        audioPath = receivedAudio.path;
      });
    } catch (e) {
      widget.logger.e("Home: Error while processing audio - $e");
    }
  }

  @override
  void initState() {
    widget.logger.i("Home: Initializing state");

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
    widget.logger.i("Home: Disposing");

    audioRecord.dispose();
    audioPlayer.dispose();
    super.dispose();
  }
}

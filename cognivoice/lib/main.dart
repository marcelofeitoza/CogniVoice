import 'dart:convert';
import 'dart:io';

import 'package:cognivoice/utils/convertAudio.util.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:record/record.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.deepPurple,
          secondary: Colors.white,
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Response {
  final int statusCode;
  final dynamic body;

  Response({required this.statusCode, required this.body});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      statusCode: json['statusCode'],
      body: json['body'],
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
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
        });
      }
    } catch (e) {
      debugPrint("Error: $e");
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
      debugPrint("Error: $e");
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
      debugPrint("Error: $e");
    }
  }

  Future<String> ibmWatsonSpeechToText() async {
    String apiUrl =
        "https://api.us-east.speech-to-text.watson.cloud.ibm.com/instances/363924f9-eb5c-4e79-84f9-a2805d45034e/v1/recognize";
    String apiKey = "PX4rXKHltIugQfeFq3ssADcBGw3_hLSJVc-Fg7zgmttg";

    String audioFilePath = audioPath;
    String flacFilePath = await convertAudio(audioFilePath, 'm4a', 'flac');
    File flacFile = File(flacFilePath);
    List<int> flacBytes = await flacFile.readAsBytes();

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Authorization": "Basic ${base64Encode(utf8.encode("apikey:$apiKey"))}",
        "Content-Type": "audio/flac",
      },
      body: flacBytes,
    );

    debugPrint("Response: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    return response.body;
  }

  // Future<void> postAudio() async {
  //   setState(() {
  //     this.response = "Waiting...";
  //   });

  //   String apiUrl = "http://10.128.69.29:3001/";

  //   String audioFilePath = audioPath;

  //   String flacFilePath = await convertAudio(audioFilePath, 'm4a', 'flac');
  //   File flacFile = File(flacFilePath);
  //   List<int> flacBytes = await flacFile.readAsBytes();

  //   final response = await http.post(
  //     Uri.parse(apiUrl),
  //     headers: {
  //       "Content-Type": "audio/flac",
  //     },
  //     body: flacBytes,
  //   );

  //   debugPrint("Response: ${response.statusCode}");
  //   debugPrint("Response Body: ${response.body}");

  //   setState(() {
  //     this.response = response.body;
  //   });
  // }

  Future<void> postAudio() async {
    setState(() {
      this.response = "Waiting...";
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

    if (response.statusCode == 200) {
      debugPrint("Response: ${response.statusCode}");
      debugPrint("Response Body: ${response.body}");

      setState(() {
        this.response = message!;
      });
    } else {
      debugPrint("Response: ${response.statusCode}");
      debugPrint("Response Body: ${response.body}");

      setState(() {
        this.response = message!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
        ),
        body: Center(
          child: ListView(
            children: [
              if (!isRecording)
                Column(children: [
                  Text(
                    response,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16)
                ]),
              if (isRecording)
                const Text(
                  'Recording...',
                ),
              ElevatedButton(
                  onPressed: isRecording ? stopRecording : startRecording,
                  child:
                      Text(isRecording ? 'Stop Recording' : 'Start Recording')),
              const SizedBox(
                height: 24,
              ),
              if (!isRecording && audioPath.isNotEmpty)
                Column(
                  children: [
                    if (isPlaying)
                      const Text(
                        'Playing...',
                      ),
                    if (!isPlaying)
                      ElevatedButton(
                          onPressed: playRecording,
                          child: const Text('Play recording')),
                    ElevatedButton(
                        onPressed: postAudio, // processRecording,
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Process Recording'),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.send)
                          ],
                        )),
                    if (audioPath.isNotEmpty)
                      const ElevatedButton(
                          onPressed: null,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.delete_outline),
                              SizedBox(
                                width: 8,
                              ),
                              Text('Delete Recording'),
                            ],
                          ))
                  ],
                )
            ],
          ),
        ));
  }
}

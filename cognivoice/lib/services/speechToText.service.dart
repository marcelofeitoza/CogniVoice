import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:cognivoice/utils/convertAudio.util.dart';

Future<String> ibmWatsonSpeechToText(String audioPath) async {
  const apiUrl =
      "https://api.us-east.speech-to-text.watson.cloud.ibm.com/instances/363924f9-eb5c-4e79-84f9-a2805d45034e/v1/recognize";
  const apiKey = "PX4rXKHltIugQfeFq3ssADcBGw3_hLSJVc-Fg7zgmttg";

  try {
    final flacFilePath = await convertAudio(audioPath, '.m4a', '.flac');
    final flacBytes = File(flacFilePath).readAsBytesSync();

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Authorization": "Basic ${base64Encode(utf8.encode("apikey:$apiKey"))}",
        "Content-Type": "audio/flac",
      },
      body: flacBytes,
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('IBM Watson Speech to Text request failed');
    }
  } catch (e) {
    throw Exception('Error in ibmWatsonSpeechToText: $e');
  }
}

Future<String> speechToText(
    String apiUrl, String audioPath, String? apiKey) async {
  // String apiUrl =
  // "https://api.us-east.speech-to-text.watson.cloud.ibm.com/instances/363924f9-eb5c-4e79-84f9-a2805d45034e/v1/recognize";
  // String apiKey = "PX4rXKHltIugQfeFq3ssADcBGw3_hLSJVc-Fg7zgmttg";

  String audioFilePath = audioPath;

  String flacFilePath = await convertAudio(audioFilePath, '.m4a', '.flac');
  File flacFile = File(flacFilePath);
  List<int> flacBytes = await flacFile.readAsBytes();

  // headers
  Map<String, String> headers = {
    "Content-Type": "audio/flac",
  };

  if (apiKey != null) {
    headers["Authorization"] =
        "Basic ${base64Encode(utf8.encode("apikey:$apiKey"))}";
  }

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: headers,
    body: flacBytes,
  );

  return response.body;
}


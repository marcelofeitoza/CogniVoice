import 'package:cognivoice/models/audioProcessingResult.model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

Future<AudioProcessingResult> postAudio(String audioFilePath) async {
  String? apiUrl = dotenv.env['API_URL'];
  const String path = "";

  if (apiUrl == null) {
    return AudioProcessingResult(
      audio: audioFilePath,
      message: "API_URL not found",
      statusCode: -1,
    );
  }

  List<int> audioBytes = await File(audioFilePath).readAsBytes();

  final response = await http.post(
    Uri.parse("$apiUrl/$path"),
    headers: {
      'Content-Type': 'audio/mp4', // or 'audio/x-m4a'
    },
    body: audioBytes,
  );

  final jsonResponse = json.decode(response.body);
  final String message = jsonResponse['message'];

  if (response.statusCode == 200) {
    final String audioPath = jsonResponse['audio'];

    return AudioProcessingResult(
      audio: audioPath,
      message: message,
      statusCode: response.statusCode,
    );
  } else {
    return AudioProcessingResult(
      audio: "",
      message: message,
      statusCode: response.statusCode,
    );
  }
}

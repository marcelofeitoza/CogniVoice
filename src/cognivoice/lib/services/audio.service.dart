import 'package:cognivoice/models/audioProcessingResult.model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'dart:convert';
import 'dart:io';

class AudioService {
  Future<AudioProcessingResult> postAudio(
      String audioFilePath, String mode) async {

    String? apiUrl = dotenv.env['API_URL'];
    String path = "process";

    if (apiUrl == null) {
      return AudioProcessingResult(
        audio: audioFilePath,
        message: "API_URL not found",
        statusCode: -1,
      );
    }

    List<int> audioBytes = await File(audioFilePath).readAsBytes();

    final response = await http.post(
      Uri.parse("$apiUrl/$path/$mode"),
      headers: {'Content-Type': 'audio/mp4'},
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

  Future<File> decodeAudio(String audioBase64) async {
    final Uint8List audioBytes = base64.decode(audioBase64);
    final Directory tempDir = await getTemporaryDirectory();
    final File tempFile = File('${tempDir.path}/audio.m4a');

    await tempFile.writeAsBytes(audioBytes);

    return tempFile;
  }
}

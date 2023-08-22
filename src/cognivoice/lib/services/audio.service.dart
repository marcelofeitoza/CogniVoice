import 'package:cognivoice/models/audioProcessingResult.model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:loggerw/loggerw.dart';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:io';

class AudioService {
  Future<AudioProcessingResult> postAudio(
      String audioFilePath, Logger logger, String? mode) async {
    String? apiUrl = dotenv.env['API_URL'];
    String path = "v1/chat/ask";

    logger.i("AudioService: Posting audio to $apiUrl/$path");

    if (apiUrl == null) {
      logger.e("AudioService: API_URL not found");

      return AudioProcessingResult(
        audio: audioFilePath,
        message: "API_URL not found",
        statusCode: -1,
      );
    }

    List<int> audioBytes = await File(audioFilePath).readAsBytes();
    logger.i("AudioService: Audio bytes length - ${audioBytes.length}");

    final response = await http.post(
      Uri.parse("$apiUrl/$path/$mode"),
      headers: {'Content-Type': 'audio/mp4'},
      body: audioBytes,
    );
    logger.i("AudioService: Response status code - ${response.statusCode}");

    final jsonResponse = json.decode(response.body);

    final String message = jsonResponse['message'];
    logger.i("AudioService: Response message - $message");

    if (response.statusCode == 200) {
      logger.i("AudioService: Response success");

      final String audioPath = jsonResponse['audio'];

      return AudioProcessingResult(
        audio: audioPath,
        message: message,
        statusCode: response.statusCode,
      );
    } else {
      logger.e("AudioService: Response error - $message");

      return AudioProcessingResult(
        audio: "",
        message: message,
        statusCode: response.statusCode,
      );
    }
  }

  Future<File> decodeAudio(String audioBase64, Logger logger) async {
    logger.i("AudioService: Decoding audio");

    final Uint8List audioBytes = base64.decode(audioBase64);
    logger.i("AudioService: Audio bytes length");

    final Directory tempDir = await getTemporaryDirectory();
    logger.i("AudioService: Temporary directory");

    final File tempFile = File('${tempDir.path}/audio.m4a');
    logger.i("AudioService: Temporary file created");

    await tempFile.writeAsBytes(audioBytes);
    logger.i("AudioService: Audio file written to temporary file");

    return tempFile;
  }
}

import 'package:cognivoice/models/audioProcessingResult.model.dart';
import 'package:cognivoice/utils/convertAudio.util.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

Future<AudioProcessingResult> postAudio(String audioFilePath) async {
  // String apiUrl = dotenv.env['API_URL'];
  String apiUrl = "http://10.128.69.29:3001/";

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

    return AudioProcessingResult(
      tempFilePath: tempFilePath,
      message: message,
      statusCode: response.statusCode,
    );
  } else {
    return AudioProcessingResult(
      message: message,
      statusCode: response.statusCode,
    );
  }
}

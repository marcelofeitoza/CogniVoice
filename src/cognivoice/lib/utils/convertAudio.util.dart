import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

Future<String> convertAudio(
    String inputPath, String inputForm, String outputFormat) async {
  final FlutterFFmpeg flutterFFmpeg = FlutterFFmpeg();

  final String outputPath =
      inputPath.replaceAll('.$inputForm', '.$outputFormat');

  final String command = "-i $inputPath -c:a flac $outputPath";

  int result = await flutterFFmpeg.execute(command);
  flutterFFmpeg.cancel();

  if (result == 0) {
    return outputPath;
  } else {
    return "Error";
  }
}

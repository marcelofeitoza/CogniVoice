import 'dart:typed_data';

import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'dart:convert';
import 'dart:io';

Future<String> convertBufferToM4A(String audioBuffer) async {
  final FlutterFFmpeg _flutterFFmpeg = FlutterFFmpeg();
  final Uint8List buffer = base64.decode(audioBuffer);

  const String inputPath = './input.wav';
  const String outputPath = './output.m4a';

  await File(inputPath).writeAsBytes(buffer);

  const String command = '-i $inputPath -c:a aac -strict -2 $outputPath';
  int result = await _flutterFFmpeg.execute(command);

  if (result == 0) {
    return outputPath;
  } else {
    return '';
  }
}

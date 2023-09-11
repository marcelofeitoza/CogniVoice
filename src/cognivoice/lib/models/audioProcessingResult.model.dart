class AudioProcessingResult {
  final String question;
  final String audio;
  final String message;
  final int statusCode;

  AudioProcessingResult({
    required this.question,
    required this.audio,
    required this.message,
    required this.statusCode,
  });
}

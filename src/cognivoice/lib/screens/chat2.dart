import 'package:audioplayers/audioplayers.dart';
import 'package:cognivoice/components/message.component.dart';
import 'package:record/record.dart';
// import 'package:cognivoice/mock_chat.dart';
import 'package:cognivoice/models/message.model.dart';
import 'package:cognivoice/providers/user.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loggerw/loggerw.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen(
      {Key? key,
      required this.context,
      required this.ref,
      required this.logger})
      : super(key: key);

  final BuildContext context;
  final WidgetRef ref;
  final Logger logger;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  late User user;

  bool isRecording = false;
  String audioPath = "";

  bool isPlayingRecordedAudio = false;

  final Record audioRecord = Record();
  final AudioPlayer audioPlayer = AudioPlayer();

  final List<ChatMessage> chat = [];

  @override
  Widget build(BuildContext context) {
    user = ref.read(userProvider);

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            widget.logger.i("ChatScreen: Back button pressed");
            Navigator.pop(context);
          },
        ),
        title: Image.asset(
          'assets/logo.png',
          width: 128,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        actions: [
          IconButton(
              onPressed: () {
                widget.logger.i("ChatScreen: Settings button pressed");
                Navigator.pushNamed(context, '/settings');
              },
              icon: const Icon(Icons.settings_outlined)),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: _renderChat(chat),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
            ),
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: audioPath.isNotEmpty
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              children: [
                if (audioPath.isNotEmpty) ...[
                  AudioPlayerWidget(audioPath, onDelete: deleteAudio),
                  const SizedBox(width: 8),
                ],
                GestureDetector(
                  onTap: audioPath.isNotEmpty
                      ? sendMessage
                      : isRecording
                          ? stopRecording
                          : startRecording,
                  child: Container(
                    width: 64,
                    height: 64,
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF277AFF),
                          Color(0xFF12307C),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: Icon(
                      audioPath.isNotEmpty
                          ? Icons.send
                          : isRecording
                              ? Icons.stop
                              : Icons.graphic_eq,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderChat(List<ChatMessage> chat) {
    if (chat.isEmpty) {
      return Center(
        child: Text(
          "No messages yet... Start a conversation!",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: chat.length,
      itemBuilder: (BuildContext context, int index) {
        return MessageComponent(chat[index]);
      },
    );
  }

  void sendMessage() {
    widget.logger.i("ChatScreen: Sending message");

    if (audioPath.isNotEmpty) {
      chat.add(
        ChatMessage(
          id: '',
          isUser: true,
          chatId: '',
          content: 'Hello world',
          audio: '',
          audioUrl: '',
          createdAt: '',
          updatedAt: '',
        ),
      );

      Future.delayed(const Duration(seconds: 1), () {
        chat.add(
          ChatMessage(
            id: '',
            isUser: false,
            chatId: '',
            content: 'Hello world',
            audio: '',
            audioUrl: '',
            createdAt: '',
            updatedAt: '',
          ),
        );

        setState(() {
          audioPath = "";
        });
      });

      setState(() {
        audioPath = "";
      });
    }
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
      widget.logger.e("ChatScreen: Error starting recording - $e");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text("Error: Could not start recording"),
        ),
      );
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
      widget.logger.e("ChatScreen: Error stopping recording - $e");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text("Error: Could not stop recording"),
        ),
      );
    }
  }

  void deleteAudio() {
    setState(() {
      audioPath = "";
    });
  }
}

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget(this.path, {Key? key, required this.onDelete})
      : super(key: key);

  final String path;
  final VoidCallback onDelete;

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  bool isPlaying = false;
  String path = "";
  late Source urlSource;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    urlSource = UrlSource(widget.path);
  }

  Future<void> playPauseAudio() async {
    try {
      // await AudioPlayer().play(urlSource);
      await audioPlayer.play(AssetSource("audio-file.flac"));
      setState(() {
        isPlaying = true;
      });

      audioPlayer.onPlayerComplete.listen((event) {
        setState(() {
          isPlaying = false;
        });
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text("Error: Could not play audio"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff2e2e2e),
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              widget.onDelete(); // Call the onDelete callback
            },
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF277AFF),
                    Color(0xFF12307C),
                  ],
                ),
                borderRadius: BorderRadius.circular(32.0),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.delete_outline,
                size: 24.0,
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: playPauseAudio,
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF277AFF),
                    Color(0xFF12307C),
                  ],
                ),
                borderRadius: BorderRadius.circular(32.0),
              ),
              alignment: Alignment.center,
              child: Icon(
                isPlaying ? Icons.stop : Icons.play_arrow,
                size: 24.0,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            children: [
              Slider(
                value: position.inSeconds.toDouble(),
                min: 0.0,
                max: duration.inSeconds.toDouble(),
                onChanged: (double value) {
                  setState(() {
                    audioPlayer.seek(Duration(seconds: value.toInt()));
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatTime(position),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    formatTime(duration - position),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].map(twoDigits).join(':');
  }
}

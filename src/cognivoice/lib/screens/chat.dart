import 'package:audioplayers/audioplayers.dart';
import 'package:cognivoice/providers/user.provider.dart';
import 'package:cognivoice/services/audio.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:record/record.dart';
import 'package:flutter/material.dart';
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
  Widget _renderChat(List<Map<String, dynamic>> chat) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: chat.length,
      itemBuilder: (BuildContext context, int index) {
        return _renderChatItem(chat[index]);
      },
    );
  }

  Widget _renderChatItem(Map<String, dynamic> chatItem) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment:
            chatItem["user"] ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: chatItem["user"]
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatItem["message"],
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
                const SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    user = ref.read(userProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            widget.logger.i("ChatScreen: Back button pressed");
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png',
          width: 128.0,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              widget.logger.i("ChatScreen: Settings button pressed");
              Navigator.pushNamed(context, '/work');
            },
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _renderChat(chat),
                const SizedBox(
                  height: 80.0,
                )
              ],
            ),
          )),
          Row(
            children: [
              Text("$audioPath", style: TextStyle(color: Colors.black)),
            ],
          ),
          Container(
            height: 128.0,
            color: Colors.transparent,
            child: Stack(
              children: [
                Positioned(
                  top: 48.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 96.0,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(isRecording ? "Stop" : "Speak",
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .fontSize,
                              color: const Color(0xff2e2e2e),
                            )),
                        GestureDetector(
                          onTap: isRecording ? stopRecording : startRecording,
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
                              isRecording ? Icons.stop : Icons.graphic_eq,
                              size: 24.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text("Type",
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .fontSize,
                              color: const Color(0xff2e2e2e),
                            )),
                        Container(
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
                          child: const Icon(
                            Icons.keyboard_alt_outlined,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  late User user;
  List<Map<String, dynamic>> chat = [
    {
      "user": true,
      "message": "Qual foi o faturamento da empresa no último mês?",
      "audio": "audio",
    },
    {
      "user": false,
      "message":
          "O faturamento da empresa no último mês foi de R\$ 1.000.000,00",
      "audio": "audio",
    },
    {
      "user": true,
      "message": "Como posso melhorar o faturamento da empresa?",
      "audio": "audio",
    },
    {
      "user": false,
      "message": "Você pode melhorar o faturamento da empresa fazendo X, Y e Z",
      "audio": "audio",
    },
    {
      "user": true,
      "message": "Obrigado!",
      "audio": "audio",
    },
    {
      "user": false,
      "message": "De nada!",
      "audio": "audio",
    },
  ];
  final AudioService audioService = AudioService();
  final Record audioRecord = Record();
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isRecording = false;
  String question = "";
  String audioPath = "";
  String tempAudioPath = "";
  bool isPlaying = false;
  String response = "Waiting...";
  int statusCode = 0;

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

  @override
  void initState() {
    widget.logger.i("ChatScreen: Initializing state");

    super.initState();
  }

  @override
  void dispose() {
    widget.logger.i("ChatScreen: Disposing");

    super.dispose();
  }
}

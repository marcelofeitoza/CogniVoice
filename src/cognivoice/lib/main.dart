import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cognivoice/screens/select-mode.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cognivoice/screens/login.dart';
import 'package:cognivoice/screens/work.dart';
import 'package:cognivoice/theme/theme.dart';
import 'package:flutter/material.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(const ProviderScope(child: CogniVoice()));
}

class CogniVoice extends ConsumerWidget {
  const CogniVoice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Cogni Voice',
      theme: ThemeData(
        colorScheme: CogniVoiceTheme.colorScheme,
        textTheme: CogniVoiceTheme.textTheme,
        fontFamily: 'IBM_Plex_Sans',
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: <String, WidgetBuilder>{
        '/work': (BuildContext context) => Work(context: context, ref: ref),
        '/login': (BuildContext context) => Login(context: context, ref: ref),
        '/select-mode': (BuildContext context) =>
            SelectMode(context: context, ref: ref),
      },
    );
  }
}

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cognivoice/screens/login.dart';
import 'package:cognivoice/screens/work.dart';
import 'package:flutter/material.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(const CogniVoice());
}

class CogniVoice extends StatelessWidget {
  const CogniVoice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cogni Voice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          background: const Color(0xFF161616),
          primary: const Color(0xFFf1f1f1),
          secondary: const Color(0xff12307c),
          seedColor: const Color(0xFF12307c),
          error: Colors.red[400],
          brightness: Brightness.dark,
        ),
        fontFamily: 'IBM_Plex_Sans',
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: <String, WidgetBuilder>{
        '/work': (BuildContext context) => Work(context: context),
        '/login': (BuildContext context) => Login(context: context),
      },
    );
  }
}

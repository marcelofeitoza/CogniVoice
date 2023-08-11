import 'package:cognivoice/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Future void main() async {
//   await dotenv.load(fileName: "assets/.env", mergeWith: {
//     'TEST_VAR': '5',
//   });

//   runApp(const CogniVoice());
// }

Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(const CogniVoice());
}

class CogniVoice extends StatelessWidget {
  const CogniVoice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: const Color(0xFFf1f1f1),
          secondary: const Color(0xff12307c),
          seedColor: const Color(0xFF12307c),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const Home(),
      },
    );
  }
}

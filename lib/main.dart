import 'package:firebase_core/firebase_core.dart';
import 'package:stride/firebase_options.dart';
import 'package:stride/screens/splash.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: Main()));
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'oilioFitness',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color.fromARGB(255, 106, 167, 78),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          // ignore: deprecated_member_use
          fillColor: Colors.white.withOpacity(0.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            // ignore: deprecated_member_use
            borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            // ignore: deprecated_member_use
            borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            // ignore: deprecated_member_use
            side: BorderSide(color: Colors.white.withOpacity(0.1)),
          ),
        ),
      ),
      home: Scaffold(body: const Splash()),
    );
  }
}

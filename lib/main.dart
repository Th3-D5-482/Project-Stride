import 'package:stride/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Main()));
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
      ),
      home: Scaffold(body: const Splash()),
    );
  }
}

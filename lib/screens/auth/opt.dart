import 'package:flutter/material.dart';

class Opt extends StatefulWidget {
  const Opt({super.key});

  @override
  State<Opt> createState() => _OptState();
}

class _OptState extends State<Opt> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'OTP Screen comming soon...',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

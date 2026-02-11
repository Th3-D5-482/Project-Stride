import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 80),
                Center(
                  child: Image.asset(
                    'assets/images/random/logo.png',
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
                SizedBox(height: 80),
                TextField(
                  decoration: InputDecoration(hintText: '000-000-0000'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

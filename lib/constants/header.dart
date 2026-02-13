import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded, size: 28),
            ),
            Row(
              children: [
                Text(
                  'oilio',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Fitness',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 50),
        Center(
          child: CircleAvatar(
            radius: 90,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/images/icons/logo2.png'),
          ),
        ),
        SizedBox(height: 90),
      ],
    );
  }
}

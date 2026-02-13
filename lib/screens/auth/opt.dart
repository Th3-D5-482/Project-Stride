import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stride/screens/terms_n_conditions.dart';

class Opt extends StatefulWidget {
  final bool isEmail;
  final String sendersData;
  const Opt({super.key, required this.isEmail, required this.sendersData});

  @override
  State<Opt> createState() => _OptState();
}

class _OptState extends State<Opt> {
  late TextEditingController otpController1 = TextEditingController();
  late TextEditingController otpController2 = TextEditingController();
  late TextEditingController otpController3 = TextEditingController();
  late TextEditingController otpController4 = TextEditingController();
  late Timer timer;
  int remainingSeconds = 30;
  late FocusNode focusNode1;
  late FocusNode focusNode2;
  late FocusNode focusNode3;
  late FocusNode focusNode4;

  @override
  void initState() {
    super.initState();
    otpController1 = TextEditingController(text: '8');
    otpController2 = TextEditingController(text: '4');
    otpController3 = TextEditingController(text: '7');
    otpController4 = TextEditingController(text: '2');
    startTimer();
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode3 = FocusNode();
    focusNode4 = FocusNode();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    otpController1.dispose();
    otpController2.dispose();
    otpController3.dispose();
    otpController4.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
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
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
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
              Text(
                'Enter the 4-digit code sent to ${widget.isEmail ? null : '+91'} ${widget.sendersData}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: 55,
                      height: 55,
                      child: TextField(
                        controller: [
                          otpController1,
                          otpController2,
                          otpController3,
                          otpController4,
                        ][index],
                        focusNode: [
                          focusNode1,
                          focusNode2,
                          focusNode3,
                          focusNode4,
                        ][index],
                        decoration: InputDecoration(
                          hintText: '',
                          counterText: '',
                        ),
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            if (index < 3) {
                              FocusScope.of(context).requestFocus(
                                [
                                  focusNode1,
                                  focusNode2,
                                  focusNode3,
                                  focusNode4,
                                ][index + 1],
                              );
                            } else {
                              FocusScope.of(context).unfocus();
                            }
                          } else if (value.isEmpty) {
                            if (index > 0) {
                              FocusScope.of(context).requestFocus(
                                [
                                  focusNode1,
                                  focusNode2,
                                  focusNode3,
                                  focusNode4,
                                ][index - 1],
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              widget.isEmail
                  ? Column(
                      children: [
                        SizedBox(height: 30),
                        Text(
                          'Tip: Check your spam folder if you don\'t see the email in your inbox.',
                        ),
                        SizedBox(height: 30),
                      ],
                    )
                  : SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (otpController1.text.isNotEmpty &&
                      otpController2.text.isNotEmpty &&
                      otpController3.text.isNotEmpty &&
                      otpController4.text.isNotEmpty) {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            TermsNConditions(),
                        transitionDuration: Duration(milliseconds: 500),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) =>
                                FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor:
                      otpController1.text.isNotEmpty &&
                          otpController2.text.isNotEmpty &&
                          otpController3.text.isNotEmpty &&
                          otpController4.text.isNotEmpty
                      ? Theme.of(context).primaryColor
                      : Colors.grey.shade700,
                ),
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      'Verify',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (!timer.isActive) {
                    setState(() {
                      remainingSeconds = 30;
                      startTimer();
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(0, 50),
                  backgroundColor: Colors.transparent,
                  // ignore: deprecated_member_use
                  side: BorderSide(color: Colors.white.withOpacity(0.1)),
                ),
                child: Text(
                  'Resend code in 00:${remainingSeconds.toString().padLeft(2, '0')}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

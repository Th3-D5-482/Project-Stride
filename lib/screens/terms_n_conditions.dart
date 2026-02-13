import 'package:flutter/material.dart';
import 'package:stride/screens/home.dart';

class TermsNConditions extends StatefulWidget {
  const TermsNConditions({super.key});

  @override
  State<TermsNConditions> createState() => _TermsNConditionsState();
}

class _TermsNConditionsState extends State<TermsNConditions> {
  String fileContent = "";
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    loadFileContent();
  }

  Future<void> loadFileContent() async {
    String content = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/text/terms_and_conditions.txt');
    setState(() {
      fileContent = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded, size: 28),
                    ),
                    Text(
                      'Terms & Conditions',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'oilio',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      'Fitness',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "We are truly excited to partner with you on your fitness journey. These terms and conditions are designed to ensure that your training experience remains smooth, professional, and enjoyable from start to finish. ",
                  style: TextStyle(fontSize: 16, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                  fileContent,
                  style: TextStyle(fontSize: 16, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.redAccent,
                    ),
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Checkbox(
                          value: isChecked,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                        ),
                      ),
                      TextSpan(
                        text:
                            'By signing this document or completing payment, the client acknowledges that they have carefully read, fully understood, and agreed to abide by these terms and conditions.',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (isChecked) {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const Home(),
                          transitionDuration: const Duration(milliseconds: 500),
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
                    backgroundColor: isChecked
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade700,
                    side: BorderSide(
                      color: isChecked
                          ? Theme.of(context).primaryColor
                          : Colors.grey.shade700,
                    ),
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded, size: 25),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

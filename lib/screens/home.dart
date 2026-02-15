import 'package:flutter/material.dart';
import 'package:stride/screens/profile.dart';
import 'package:stride/screens/subscriptions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // ignore: deprecated_member_use
        backgroundColor: Colors.white.withOpacity(0.1),
        currentIndex: selectedIndex,
        onTap: (value) => setState(() => selectedIndex = value),
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        unselectedFontSize: 14,
        selectedIconTheme: IconThemeData(size: 26),
        unselectedIconTheme: IconThemeData(size: 24),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'Subscription',
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: const [MainHomePage(), Subscriptions()],
      ),
    );
  }
}

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Profile(),
                      transitionDuration: Duration(microseconds: 500),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              FadeTransition(opacity: animation, child: child),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 25,
                  // ignore: deprecated_member_use
                  backgroundColor: Colors.white.withOpacity(0.1),
                  child: Icon(Icons.person, size: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

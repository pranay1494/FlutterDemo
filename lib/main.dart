import 'package:flutter/material.dart';
import 'package:flutterautos/screens/login_screen.dart';
import 'package:flutterautos/screens/splash.dart';
void main() {
  runApp(
      AutosApp()
  );
}

class AutosApp extends StatelessWidget {
  const AutosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}


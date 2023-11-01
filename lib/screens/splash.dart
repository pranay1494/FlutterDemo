import 'package:flutter/material.dart';
import 'package:flutterautos/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          "Autos Flutter",
          style: TextStyle(
              color: Colors.white,
              fontSize: 36
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    moveToLogin();
  }

  void moveToLogin() async {
    await Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => LoginScreen()));
    });
  }

}
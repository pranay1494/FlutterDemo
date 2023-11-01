import 'package:flutter/material.dart';
import 'package:flutterautos/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: const Center(
        child: Text("Home screen"),
      ),
    );
  }
}

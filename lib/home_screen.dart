import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Text(
          "Welcome to the home screen",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}

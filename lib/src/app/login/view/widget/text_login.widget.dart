import 'package:flutter/material.dart';

class TextLoginWidget extends StatelessWidget {
  const TextLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        'WELCOME TO TORTIMAZER 3.0',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

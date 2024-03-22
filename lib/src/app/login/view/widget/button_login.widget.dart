import 'package:flutter/material.dart';

class ButtonLoginWidget extends StatelessWidget {
  const ButtonLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        child: const SizedBox(
          width: double.infinity,
          child: Text(
            'Login',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// * View Models
import '/src/app/login/view/provider/ui/login.view_model.dart';

class InputsLoginWidget extends StatelessWidget {
  const InputsLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Username',
              hintText: 'Enter your username',
              floatingLabelStyle: const TextStyle(
                color: Colors.black,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onChanged: (value) {
              loginViewModel.userName = value;
            },
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
              floatingLabelStyle: const TextStyle(
                color: Colors.black,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onChanged: (value) {
              loginViewModel.password = value;
            },
          ),
        ],
      ),
    );
  }
}

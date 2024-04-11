import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// * Providers
import '/src/app/login/view/provider/model/login.provider.dart';

// * View Models
import '/src/app/login/view/provider/ui/login.view_model.dart';

class ButtonLoginWidget extends StatelessWidget {
  const ButtonLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: ElevatedButton(
        onPressed: () async {
          final resp = loginProvider.login(
            userName: loginViewModel.userName,
            password: loginViewModel.password,
          );

          if (resp) {
            await SharedPreferences.getInstance().then((preferences) {
              preferences
                  .setBool('isLogged', true)
                  .then((value) => Navigator.pushNamed(context, '/home'))
                  .catchError(
                    (_) => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('An error occurred'),
                      ),
                    ),
                  );
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Invalid user or password'),
              ),
            );
          }
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

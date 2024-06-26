import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// * Providers
import '/src/app/login/view/provider/model/login.provider.dart';

// * View Models
import '/src/app/login/view/provider/ui/login.view_model.dart';

// * Widgets
import '/src/app/login/view/widget/text_login.widget.dart';
import '/src/app/login/view/widget/logo.widget.dart';
import '/src/app/login/view/widget/inputs_login.widget.dart';
import '/src/app/login/view/widget/button_login.widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => LoginViewModel()),
                ChangeNotifierProvider(create: (_) => LoginProvider()),
              ],
              builder: (context, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextLoginWidget(),
                    const Center(
                      child: LogoWidget(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.04,
                      ),
                      child: Container(
                        color: const Color(0xFF88C16A),
                        child: const Column(
                          children: [
                            InputsLoginWidget(),
                            ButtonLoginWidget(),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// * Pages
import '/src/app/login/view/page/login.dart';
import '/src/app/home/view/page/home.page.dart';

class RouterSystem {
  static Future<Widget> routes() async {
    bool session = await _getSession();

    return MaterialApp(
      title: 'Tortimazer 3.0',
      initialRoute: session ? '/home' : '/login',
      routes: {
        '/login': (_) => const LoginPage(),
        '/home': (_) => const HomePage(),
      },
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }

  static Future<bool> _getSession() async {
    final SharedPreferences preference = await SharedPreferences.getInstance();

    final bool? session = preference.getBool('isLogged');

    if (session == null || session == false) {
      return false;
    }

    return true;
  }
}

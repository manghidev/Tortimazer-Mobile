import 'package:flutter/material.dart';

// * Pages
import '/src/app/login/view/page/login.dart';
import '/src/app/home/view/page/home.page.dart';

class RouterSystem {
  static Future<Widget> routes() async {
    return MaterialApp(
      title: 'Tortimazer App',
      initialRoute: '/home',
      routes: {
        '/login': (_) => const LoginPage(),
        '/home': (_) => const HomePage(),
      },
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}

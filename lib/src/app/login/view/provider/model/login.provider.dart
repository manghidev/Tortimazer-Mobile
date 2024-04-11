import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  login({required String userName, required String password}) {
    if (userName == 'tortilleriaGutierrez' && password == 'tortillas') {
      return true;
    } else {
      return false;
    }
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  String _userName = '';
  String _password = '';

  late Timer timer = Timer(const Duration(seconds: 3), () {});

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
    notifyListeners();
  }

  String get password => _password;

  set password(String value) {
    _password = value;
    notifyListeners();
  }
}

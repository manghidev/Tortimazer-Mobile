import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountTortillasViewModel extends ChangeNotifier {
  int _count = 30;
  bool _isSending = false;
  bool _errorConnection = false;
  bool _isNotifiedError = false;

  CountTortillasViewModel() {
    getCount();
  }

  late Timer timer = Timer(const Duration(seconds: 3), () {});

  set count(int value) {
    _count = value;
    notifyListeners();
  }

  int get count => _count;

  void increment() {
    _count++;

    if (timer.isActive) timer.cancel();

    timer = Timer(const Duration(seconds: 3), () {
      _isSending = true;
      notifyListeners();
    });

    notifyListeners();
  }

  void decrement() {
    _count == 0 ? _count = 0 : _count--;

    if (timer.isActive) timer.cancel();

    timer = Timer(const Duration(seconds: 3), () {
      _isSending = true;
      notifyListeners();
    });

    notifyListeners();
  }

  set isSending(bool value) {
    _isSending = value;
    notifyListeners();
  }

  bool get isSending => _isSending;

  set errorConnection(bool value) {
    _errorConnection = value;
    notifyListeners();
  }

  bool get errorConnection => _errorConnection;

  set isNotifiedError(bool value) {
    _isNotifiedError = value;
    notifyListeners();
  }

  bool get isNotifiedError => _isNotifiedError;

  void getCount() {
    SharedPreferences.getInstance().then((preferences) {
      _count = preferences.getInt('count') ?? 30;
      notifyListeners();
    });
  }
}

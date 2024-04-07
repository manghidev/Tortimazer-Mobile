import 'dart:async';

import 'package:flutter/material.dart';

class CountTortillasViewModel extends ChangeNotifier {
  int _count = 0;
  bool _isSending = false;
  bool _error = false;

  late Timer timer = Timer(const Duration(seconds: 3), () {});

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

  set error(bool value) {
    _error = value;
    notifyListeners();
  }

  bool get error => _error;
}

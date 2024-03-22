import 'package:flutter/material.dart';

class CountTortillasViewModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count == 0 ? _count = 0 : _count--;
    notifyListeners();
  }
}

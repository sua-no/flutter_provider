import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _count = 0;

  int get getCount => _count;

  void incrementCounter() {
    _count = _count + 1;
    notifyListeners();
  }
}

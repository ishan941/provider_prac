import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;

  int get getCount => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'dart:math';

class Tank with ChangeNotifier {
  int _percentage = 0;

  void setPercentage() {
    _percentage = Random().nextInt(100);
    if (_percentage < 20) {
      _percentage = 20;
    }
    notifyListeners();
  }

  int getPercentage() {
    return _percentage;
  }
}

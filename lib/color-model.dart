import 'package:flutter/material.dart';

import 'dart:math' as math;

class MyColor extends ChangeNotifier {
  Color _myColor = Color.fromARGB(1, 0, 0, 0);
  int r = 0;
  int g = 0;
  int b = 0;
  void setColor(bool value) {
    if (value) {
      r = math.Random().nextInt(255);
      g = math.Random().nextInt(255);
      b = math.Random().nextInt(255);
    } else {
      r = 0;
      g = 0;
      b = 0;
    }

    _myColor = Color.fromARGB(math.Random().nextInt(255), r, g, b);
    notifyListeners();
  }

  Color getColor() {
    return _myColor;
  }
}

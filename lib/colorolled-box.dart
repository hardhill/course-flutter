import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

import 'color-model.dart';

class ColorolledBox extends StatelessWidget {
  ColorolledBox() {}
  @override
  Widget build(BuildContext context) {
    MyColor _myColor = context.watch<MyColor>();
    return AnimatedContainer(
      width: 100,
      height: 100,
      duration: Duration(seconds: 1),
      decoration: BoxDecoration(
        color: _myColor.getColor(),
        border: Border.all(width: 2),
      ),
    );
  }
}

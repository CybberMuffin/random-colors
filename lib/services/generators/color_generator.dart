import 'dart:math';
import 'package:flutter/material.dart';

class ColorGenerator {
  static Color getRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  static Color getRandomPrimaryColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  static Color getTextColorFromBackground(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
  }
}

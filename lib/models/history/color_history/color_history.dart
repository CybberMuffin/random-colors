import 'package:flutter/material.dart';
import 'package:random_colors/models/history/history.dart';

class ColorHistory extends History with ChangeNotifier {
  List<Color> _colors = [];
  int _index;

  List<Color> get colors => _colors;
  int get index => _index;
  Color get current => _index != null ? _colors[_index] : null;

  void add(Color color) {
    _colors.add(color);
    _index = _colors.length - 1;
    notifyListeners();
  }

  @override
  void toNext() {
    if (hasNext()) ++_index;
    notifyListeners();
  }

  @override
  void toPrevious() {
    if (hasPrevious()) --_index;
    notifyListeners();
  }

  @override
  bool hasNext() {
    return _index < _colors.length - 1;
  }

  @override
  bool hasPrevious() {
    return _index > 0;
  }
}

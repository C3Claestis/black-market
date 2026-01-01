import 'package:flutter/material.dart';

class GambarSliderProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void nextPage(int length) {
    if (_currentIndex < length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }
}

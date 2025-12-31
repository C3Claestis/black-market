import 'package:flutter/material.dart';

class TemplateProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  bool centerFloatingButton = false;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setCenterFloatingButton(bool value) {
    centerFloatingButton = value;
    notifyListeners();
  } 

  void openShop() {
    centerFloatingButton = true;
    notifyListeners();
  }

  void closeShop() {
    centerFloatingButton = false;
    notifyListeners();
  }
}

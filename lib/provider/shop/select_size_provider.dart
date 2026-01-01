import 'package:flutter/material.dart';

class SelectSizeProvider extends ChangeNotifier {
  String _selectedSize;

  SelectSizeProvider(String initialSize)
      : _selectedSize = initialSize;

  String get selectedSize => _selectedSize;

  void selectSize(String size) {
    _selectedSize = size;
    notifyListeners();
  }
}

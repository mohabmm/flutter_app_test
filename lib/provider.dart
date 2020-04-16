import 'package:flutter/material.dart';

class TextProvider with ChangeNotifier {
  String _text = "";
  String get getTextData => _text;

  void setStringValue(String input) {
    _text = input;
    notifyListeners();
  }
}

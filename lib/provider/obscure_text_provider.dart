import 'package:flutter/material.dart';

class ObscureTextProvider extends ChangeNotifier {
  bool isObscure = true;

  bool get getIsObscure => isObscure;

  setObscureText(bool newIsObscure) {
    isObscure = newIsObscure;
    notifyListeners();
  }
}

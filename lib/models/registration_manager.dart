import 'package:flutter/material.dart';

import 'models.dart';

class RegistrationManager extends ChangeNotifier {
  bool get isRegistrationClicked => _isRegistrationClicked;

  var _isRegistrationClicked = false;

  void tapOnRegister(bool isClicked) {
    _isRegistrationClicked = isClicked;
    notifyListeners();
  }
}
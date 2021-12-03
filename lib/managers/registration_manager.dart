import 'package:flutter/material.dart';

import '../models/models.dart';

class RegistrationManager extends ChangeNotifier {
  bool get isRegistrationClicked => _isRegistrationClicked;

  var _isRegistrationClicked = false;

  void tapOnRegister(bool isClicked) {
    _isRegistrationClicked = isClicked;
    notifyListeners();
  }
}
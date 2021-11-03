import 'package:flutter/material.dart';

import 'models.dart';

class ProfileManager extends ChangeNotifier {
  User get getUser => User(
    firstName: 'Tomasz',
    lastName: 'Siemasz',
    role: 'patient',
  );

  bool get didSelectUser => _didSelectUser;

  var _didSelectUser = false;

  void tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }
}
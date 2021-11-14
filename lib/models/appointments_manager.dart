import 'package:flutter/material.dart';
import 'appointment.dart';

class AppointmentsManager extends ChangeNotifier {
  bool _createNewItem = false;

  bool get isCreatingNewItem => _createNewItem;

  void tapOnCreateNewItem(bool selected) {
    _createNewItem = selected;
    notifyListeners();
  }

}
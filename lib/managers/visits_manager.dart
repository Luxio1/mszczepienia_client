import 'package:flutter/material.dart';
import '../models/visit.dart';

class VisitsManager extends ChangeNotifier {
  bool _createNewItem = false;

  bool get isCreatingNewItem => _createNewItem;

  void tapOnCreateNewItem(bool selected) {
    _createNewItem = selected;
    notifyListeners();
  }

}
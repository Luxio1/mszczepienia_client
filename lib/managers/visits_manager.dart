import 'package:flutter/material.dart';
import '../models/visit.dart';

class NewVisitStates {
  static const int placeScreen = 0;
  static const int datesScreen = 1;
}

class VisitsManager extends ChangeNotifier {
  bool _createNewItem = false;
  int _creatingItemState = NewVisitStates.placeScreen;

  int _placeId = 0;
  int _vaccineId = 0;

  int get getCreatingItemState => _creatingItemState;

  bool get isCreatingNewItem => _createNewItem;

  int get getPlaceId => _placeId;
  int get getVaccineId => _vaccineId;

  void tapOnCreateNewItem(bool selected) {
    _creatingItemState = NewVisitStates.placeScreen;
    _createNewItem = selected;
    notifyListeners();
  }

  void goToDatesScreen(int placeId, int vaccineId) {
    _placeId = placeId;
    _vaccineId = vaccineId;

    _creatingItemState = NewVisitStates.datesScreen;
    notifyListeners();
  }

  void goToPlaceScreen() {
    _creatingItemState = NewVisitStates.placeScreen;
    notifyListeners();
  }

}
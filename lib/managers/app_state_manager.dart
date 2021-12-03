import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mszczepienia_client/services/api_service.dart';
import '../models/models.dart';

class AppStates {
  static const int yourAppointments = 0;
  static const int history = 1;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  int _selectedTab = AppStates.yourAppointments;

  bool get isInitialized => _initialized;
  int get getSelectedTab => _selectedTab;

  void initializeApp() {
    Timer(const Duration(milliseconds: 2000), () {
      _initialized = true;
      notifyListeners();
    });
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  void goToAppointments() {
    _selectedTab = AppStates.yourAppointments;
    notifyListeners();
  }

  void goToHistory() {
    log("go to history.");
    _selectedTab = AppStates.history;
    notifyListeners();
  }

  void logout() {
    _initialized = false;
    _selectedTab = 0;

    initializeApp();
    notifyListeners();
  }

}

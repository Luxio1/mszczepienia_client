import 'package:flutter/material.dart';

import '../models/models.dart';
import '../services/api_service.dart';

class ProfileManager extends ChangeNotifier {
  late Profile profile;

  Profile get getProfile => profile;

  bool get didSelectUser => _didSelectProfile;

  var _loggedIn = false;
  var _didSelectProfile = false;

  bool get isLoggedIn => _loggedIn;

  void tapOnProfile(bool selected) {
    _didSelectProfile = selected;
    notifyListeners();
  }

  void setUser(Patient user){
    user = user;
  }


  void register(String name, String surname, String id, String email, String password) {
    APIService.register(name, surname, id, email, password);

  }

  Future<bool> login(String email, String password) async {
    Profile? profile = await APIService.login(email, password);
    if(profile != null){
      _loggedIn = true;
      this.profile = profile;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  void logout() {
    _loggedIn = false;
    _didSelectProfile = false;
    //TODO: delete user data
    notifyListeners();
  }

}
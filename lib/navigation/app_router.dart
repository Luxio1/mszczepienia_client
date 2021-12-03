import 'package:flutter/material.dart';
import 'package:mszczepienia_client/managers/visits_manager.dart';
import '../user_screens/new_appointment_screen.dart';
import '../user_screens/profile_screen.dart';
import '../models/models.dart';
import '../user_screens/screens.dart';
import '../managers/managers.dart';

class AppRouter extends RouterDelegate
  with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;
  final ProfileManager profileManager;
  final RegistrationManager registrationManager;
  final VisitsManager appointmentsManager;

  AppRouter({
    required this.appStateManager,
    required this.profileManager,
    required this.registrationManager,
    required this.appointmentsManager,
  })
      :navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
    registrationManager.addListener(notifyListeners);
    appointmentsManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    registrationManager.removeListener(notifyListeners);
    appointmentsManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        //appStateManager
        if(!appStateManager.isInitialized) SplashScreen.page(),
        if(appStateManager.isInitialized && !profileManager.isLoggedIn) LoginPage.page(),
        if(appStateManager.isInitialized && profileManager.isLoggedIn) Home.page(appStateManager.getSelectedTab),

        //profileManager
        if(profileManager.didSelectUser) ProfileScreen.page(profileManager.getProfile),

        //registrationManager
        if(registrationManager.isRegistrationClicked) RegisterPage.page(),

        //appointmentsManager
        if(appointmentsManager.isCreatingNewItem) NewAppointmentScreen.page(),

      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route,
      result) {
    if (!route.didPop(result)) {
      return false;
    }

    if(route.settings.name == Pages.registerPath){
      registrationManager.tapOnRegister(false);
    }
    
    
    if(route.settings.name == Pages.userProfilePath){
      profileManager.tapOnProfile(false);
    }

    if(route.settings.name == Pages.newAppointment) {
      appointmentsManager.tapOnCreateNewItem(false);
    }


  return true;
}

  @override
  Future<void> setNewRoutePath(configuration) async => null;  //Have to be done only for web apps.

}
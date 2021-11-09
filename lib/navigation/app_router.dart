import 'package:flutter/material.dart';
import '../screens/profile_screen.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class AppRouter extends RouterDelegate
  with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;
  final ProfileManager profileManager;
  final RegistrationManager registrationManager;

  AppRouter({
    required this.appStateManager,
    required this.profileManager,
    required this.registrationManager,
  })
      :navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
    registrationManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    registrationManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if(!appStateManager.isInitialized) SplashScreen.page(),
        if(appStateManager.isInitialized && !appStateManager.isLoggedIn) LoginPage.page(),
        if(appStateManager.isInitialized && appStateManager.isLoggedIn) Home.page(appStateManager.getSelectedTab),

        if(profileManager.didSelectUser) ProfileScreen.page(profileManager.getUser),

        if(registrationManager.isRegistrationClicked) RegisterPage.page()

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


  return true;
}

  @override
  Future<void> setNewRoutePath(configuration) async => null;  //Have to be done only for web apps.

}
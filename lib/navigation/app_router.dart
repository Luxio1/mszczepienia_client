import 'package:flutter/material.dart';
import 'package:mszczepienia_client/admin_screens/home.dart';
import 'package:mszczepienia_client/admin_screens/profile_screen_moderator.dart';
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
  final VisitsManager visitsManager;

  AppRouter({
    required this.appStateManager,
    required this.profileManager,
    required this.registrationManager,
    required this.visitsManager,
  })
      :navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
    registrationManager.addListener(notifyListeners);
    visitsManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    registrationManager.removeListener(notifyListeners);
    visitsManager.removeListener(notifyListeners);
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

        if(appStateManager.isInitialized && profileManager.isLoggedIn && !profileManager.isModerator) Home.page(appStateManager.getSelectedTab),



        //profileManager
        if(appStateManager.isInitialized && profileManager.isModerator && profileManager.isLoggedIn) HomeAdmin.page(0),
        if(profileManager.didSelectModerator) ProfileScreenModerator.page(),
        if(profileManager.didSelectUser) ProfileScreen.page(profileManager.getProfile),

        //registrationManager
        if(registrationManager.isRegistrationClicked) RegisterPage.page(),

        //appointmentsManager
        if(visitsManager.isCreatingNewItem && visitsManager.getCreatingItemState == NewVisitStates.placeScreen) NewAppointmentScreen.page(),
        if(visitsManager.isCreatingNewItem && visitsManager.getCreatingItemState == NewVisitStates.datesScreen) NewAppointmentDatesScreen.page(),

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
      visitsManager.tapOnCreateNewItem(false);
    }

    if(route.settings.name == Pages.newAppointmentDates) {
      visitsManager.goToPlaceScreen();
    }

    //TODO: add creating support for new item screen


  return true;
}

  @override
  Future<void> setNewRoutePath(configuration) async => null;  //Have to be done only for web apps.

}
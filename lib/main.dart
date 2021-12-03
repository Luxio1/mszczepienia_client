import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mszczepienia_client/managers/visits_manager.dart';
import 'package:provider/provider.dart';
import 'helpers/mycolors.dart';
import 'models/models.dart';
import 'managers/managers.dart';
import 'navigation/app_router.dart';
import '../user_screens/screens.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(
      const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();

}

class _AppState extends State<MyApp> {

  final _appStateManager = AppStateManager();
  final _profileManager = ProfileManager();
  final _registrationManager = RegistrationManager();
  final _appointmentsManager = VisitsManager();

  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      profileManager: _profileManager,
      registrationManager: _registrationManager,
      appointmentsManager: _appointmentsManager,
    );
    super.initState();
  }

  late final String jwt;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => _appStateManager),
          ChangeNotifierProvider(create: (context) => _profileManager),
          ChangeNotifierProvider(create: (context) => _registrationManager),
          ChangeNotifierProvider(create: (context) => _appointmentsManager),
        ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          return MaterialApp(
            title: 'mSzczepienia',
            home: Router(
              routerDelegate: _appRouter,
              backButtonDispatcher: RootBackButtonDispatcher(),
            ),
          );
        },
      ),
    );
  }
}


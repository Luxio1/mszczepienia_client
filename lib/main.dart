import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'helpers/mycolors.dart';
import 'models/models.dart';
import 'navigation/app_router.dart';
import 'screens/screens.dart';
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
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
        appStateManager: _appStateManager,
        profileManager: _profileManager
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => _appStateManager),
          ChangeNotifierProvider(create: (context) => _profileManager),
        ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          return MaterialApp(
            title: 'mSzczepienia',
            home: Router(
              routerDelegate: _appRouter,
              //TODO: Add backButtonDispatcher
            ),
          );
        },
      ),
    );
  }
}


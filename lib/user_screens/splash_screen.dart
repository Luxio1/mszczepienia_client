import 'package:flutter/material.dart';
import 'package:mszczepienia_client/helpers/mycolors.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../managers/managers.dart';

class SplashScreen extends StatefulWidget {

  static MaterialPage page() {
    return MaterialPage(
      name: Pages.splashScreenPath,
      key: ValueKey(Pages.splashScreenPath),
      child: const SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);



  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              height: 200,
              image: AssetImage('assets/healthcare.png'),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Inicjalizacja...',
              style: TextStyle(fontSize: 25, color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }

}
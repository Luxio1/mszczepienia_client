import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'helpers/mycolors.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mSzczepienia',
      theme: ThemeData(
        primarySwatch: MyColors.blue
      ),
      home: const MyHomePage(title: 'mSzczepienia'),

    );
  }
}


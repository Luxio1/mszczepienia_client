import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../user_screens/screens.dart';

import '../helpers/mycolors.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import '../models/models.dart';
import '../managers/managers.dart';

class LoginPage extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: Pages.loginPath,
        key: ValueKey(Pages.loginPath),
        child: const LoginPage());
  }

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  bool hasConnection = false;

  void showSnack(String title) {
    final snackbar = SnackBar(
        content: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 15,
      ),
    ));
    scaffoldMessengerKey.currentState!.showSnackBar(snackbar);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blue,
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 300.0,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 50),
                  Image.asset('assets/healthcare.png', width: 150.0),
                  const SizedBox(height: 50),
                  const Text(
                    "Zaloguj się",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  emailField(),
                  const SizedBox(height: 10),
                  passwordField(),
                  const SizedBox(height: 20),
                  register(),
                  const SizedBox(height: 20),
                  loginButton(),
                  const SizedBox(height: 20),
                  forgotPassword(),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget emailField() {
    return TextField(
      autofocus: false,
      controller: emailController,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          labelText: 'Email',
          fillColor: Colors.white,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
    );
  }

  Widget passwordField() {
    return TextField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          labelText: 'Hasło',
          fillColor: Colors.white,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
    );
  }

  Widget register() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Jesteś nowym użytkownikiem? ",
          style: TextStyle(fontSize: 14, color: Colors.white54),
        ),
        GestureDetector(
          onTap: () {
            log("Tap.");
            Provider.of<RegistrationManager>(context, listen: false)
                .tapOnRegister(true);
          },
          child: const Text(
            "Załóż konto",
            style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  Widget loginButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white24,
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
            shape: const StadiumBorder()),
        onPressed: () async {
          checkConnection();
          if (hasConnection) {
            Provider.of<ProfileManager>(context, listen: false)
                .login(emailController.text, passwordController.text);
            if (!Provider.of<ProfileManager>(context, listen: false)
                .isLoggedIn) {
              Fluttertoast.showToast(msg: "Błędne dane logowania");
            } else {
              Fluttertoast.showToast(msg: "Logowanie udane");
            }
          } else {
            Fluttertoast.showToast(msg: "Brak połączenia z internetem");
          }
        },
        child: const Text("Zaloguj", style: TextStyle(fontSize: 14)));
  }

  Widget forgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Zapomniałeś hasła? ",
          style: TextStyle(fontSize: 14, color: Colors.white54),
        ),
        GestureDetector(
          onTap: () {
            //TODO: Add forgot password page
          },
          child: const Text(
            "Przypomnij hasło",
            style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }

    return hasConnection;
  }
}

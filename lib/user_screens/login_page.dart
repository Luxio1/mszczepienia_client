import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../user_screens/screens.dart';

import '../helpers/mycolors.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import '../models/models.dart';

class LoginPage extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Pages.loginPath,
      key: ValueKey(Pages.loginPath),
      child: const LoginPage()
    );
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

  void showSnack(String title) {
    final snackbar = SnackBar(
        content: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
          ),
        ));
    scaffoldMessengerKey.currentState!.showSnackBar(snackbar);
  }

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  children:  <Widget>[
                    const SizedBox(height: 50),
                    Image.asset('assets/healthcare.png', width: 150.0),
                    const SizedBox(height: 50),
                    const Text(
                      "Zaloguj się",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      autofocus: false,
                      controller: emailController,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          labelText: 'Email',
                          fillColor: Colors.white,
                          filled: true, contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20)
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
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
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20)
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Jesteś nowym użytkownikiem? ",
                          style: TextStyle(fontSize: 14, color: Colors.white54),
                        ),
                        GestureDetector(
                          onTap: () {
                            log("Tap.");
                            Provider.of<RegistrationManager>(context, listen: false).tapOnRegister(true);
                          },
                          child: const Text(
                            "Załóż konto",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                                decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white24,
                            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                            shape: const StadiumBorder()
                        ),
                        onPressed: ()  async {
                          Provider.of<ProfileManager>(context, listen: false). login(emailController.text, passwordController.text);
                          //TODO: Check login() response
                        },
                        child: const Text("Zaloguj", style: TextStyle(fontSize: 14))
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Zapomniałeś hasła? ",
                          style: TextStyle(fontSize: 14, color: Colors.white54),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "myRoute");
                          },
                          child: const Text(
                            "Przypomnij hasło",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                                decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
              )

            ],
          ),
        )

      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mszczepienia_client/screens/screens.dart';

import '../helpers/mycolors.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import '../models/models.dart';

class LoginPage extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
      name: '/login',
      key: ValueKey('/login'),
      child: LoginPage()
    );
  }

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
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
                          Navigator.pushNamed(context, "myRoute");
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
                        Provider.of<AppStateManager>(context, listen: false).login('username', 'password'); //TODO: Hardcoded
                        //TODO: Add logging in
                        // Map data = {
                        //   'login': emailController.text,
                        //   'password': passwordController.text
                        // };
                        //
                        // print('Email: ${emailController.text} Password: ${passwordController.text} ');
                        // final response = await http.post(Uri.parse('https://m-szczepienia.herokuapp.com/api/v1/auth/login'),
                        //   headers: {
                        //     "Content-Type": "application/json",
                        //     "Access-Control-Allow-Origin": "*",
                        //
                        //   },
                        //   body: json.encode(data),
                        //
                        // );
                        //
                        //
                        // if(response.statusCode == 200){
                        //   print('Success.');
                        //
                        // }
                        // else{
                        //   print('Something went wrong :(');
                        // }
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
      ),
    );
  }
}

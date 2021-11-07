import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mszczepienia_client/screens/screens.dart';

import '../helpers/mycolors.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import '../models/models.dart';

class RegisterPage extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
      name: '/register',
      key: ValueKey('/register'),
      child: RegisterPage()
    );
  }

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                      "Zarejestruj się",
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
                          labelText: 'Imię',
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
                          labelText: 'Nazwisko',
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20)
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
                          labelText: 'PESEL',
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20)
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
                          labelText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20)
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
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white24,
                            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                            shape: const StadiumBorder()
                        ),
                        onPressed: ()  async {
                          //Provider.of<AppStateManager>(context, listen: false).login('username', 'password'); //TODO: Hardcoded
                          //TODO: Add register
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
                        child: const Text("Załóż konto", style: TextStyle(fontSize: 14))
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

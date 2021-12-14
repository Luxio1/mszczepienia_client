import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../user_screens/screens.dart';

import '../helpers/mycolors.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import '../models/models.dart';
import '../managers/managers.dart';

class RegisterPage extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: Pages.registerPath,
        key: ValueKey(Pages.registerPath),
        child: const RegisterPage());
  }

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final idController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    idController.dispose();
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
                children: <Widget>[
                  const SizedBox(height: 50),
                  Image.asset('assets/healthcare.png', width: 150.0),
                  const SizedBox(height: 50),
                  const Text(
                    "Zarejestruj się",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  firstnameField(),
                  const SizedBox(height: 10),
                  lastnameField(),
                  const SizedBox(height: 10),
                  peselField(),
                  const SizedBox(height: 10),
                  emailField(),
                  const SizedBox(height: 10),
                  passwordField(),
                  const SizedBox(height: 20),
                  registerButton(),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget firstnameField() {
    return TextField(
      autofocus: false,
      controller: nameController,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          labelText: 'Imię',
          fillColor: Colors.white,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
    );
  }

  Widget lastnameField() {
    return TextField(
      autofocus: false,
      controller: surnameController,
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
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
    );
  }

  Widget peselField() {
    return TextField(
      autofocus: false,
      controller: idController,
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
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
    );
  }

  Widget emailField() {
    return TextField(
      autofocus: false,
      controller: emailController,
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

  Widget registerButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white24,
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
            shape: const StadiumBorder()),
        onPressed: () async {
          Provider.of<ProfileManager>(context, listen: false).register(
              nameController.text,
              surnameController.text,
              idController.text,
              emailController.text,
              passwordController.text);

          //TODO: Check register() response
        },
        child: const Text("Załóż konto", style: TextStyle(fontSize: 14)));
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
const _base = "https://m-szczepienia.herokuapp.com/api/v1/";
const _loginURL = _base + "auth/login";
const _registerURL = _base + "auth/register";
class APIService{
  static Future<bool> login(String username, String password) async{
    Map data = {
      'email': username,
      'password': password
    };

    final response = await http.post(Uri.parse(_loginURL),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(data),
    );


    if(response.statusCode == 200){
      Map<String, dynamic> respData = jsonDecode(response.body);
      log(respData['accessToken']);

      return true;
    }

    return false;
  }

  static Future<bool> register(String name, String surname, String id, String email, String password) async{
    Map data = {
      'email': email,
      'password': password,
      'firstName': name,
      'lastName': surname,
      'pesel': id
    };
    final response = await http.post(Uri.parse(_registerURL),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(data),
    );

    if(response.statusCode == 200){
      return true;
    }

    return false;

  }
}
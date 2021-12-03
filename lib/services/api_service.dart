import 'dart:convert';
import 'dart:developer';
import 'package:mszczepienia_client/models/models.dart';

import 'package:http/http.dart' as http;
const _base = "https://m-szczepienia.herokuapp.com/api/v1/";
const _loginURL = _base + "auth/login";
const _registerURL = _base + "auth/register";

class APIService{



  static Future<Profile?> login(String email, String password) async{
    Map data = {
      'email': email,
      'password': password
    };

    final response = await http.post(Uri.parse(_loginURL),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(data),
    );


    if(response.statusCode == 200){
      final profile_data_json = json.decode(response.body);

      String accessToken = profile_data_json['accessToken'];

      final user_response = await http.get(Uri.parse(_base + "patient?email=" + email),
          headers: {
            "authorization": "Bearer " + accessToken,
          }
      );

      if(user_response.statusCode == 200) {

        List<Patient> users = getUsersFromResponse(user_response);
        Profile profile = Profile.fromJson(profile_data_json, users);

        return profile;
      }
    }
    return null;
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

    log(response.body);

    if(response.statusCode == 200){
      return true;
    }

    return false;
  }


  static List<Patient> getUsersFromResponse(http.Response response) {
    List<dynamic> usersJson = json.decode(response.body);

    List<Patient> users = [];

    for(var userJson in usersJson){
      Patient user = Patient.fromJson(userJson);
      users.add(user);
    }
    return users;
  }


}
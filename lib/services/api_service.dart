import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mszczepienia_client/models/models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;
const _base = "https://m-szczepienia.herokuapp.com/api/v1/";
const _loginURL = _base + "auth/login";
const _registerURL = _base + "auth/register";
final storage = FlutterSecureStorage();


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
      await storage.write(key: 'accessToken', value: accessToken);

      String refreshToken = profile_data_json['refreshToken'];
      await storage.write(key: 'refreshToken', value: refreshToken);

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

  static Future<String> getAccessToken() async {
    String? accessToken = await storage.read(key: 'accessToken');
    return Future.value(accessToken);
  }

  static Future<List<City>> getCitiesSuggestions(String text) async {
    String accessToken = await getAccessToken();

    final response = await http.get(Uri.parse(_base + "city?name=" + text),
        headers: {
          "authorization": "Bearer " + accessToken,
        }
    );
    
    List<dynamic> citiesJson = json.decode(response.body);
    
    List<City> cities = citiesJson.map((data) => City.fromJson(data)).toList();

    return Future.value(cities);

  }

  static Future<List<Place>> getPlacesSuggestions(int id) async {
    String accessToken = await getAccessToken();

    final response = await http.get(Uri.parse(_base + "place?cityId=" + id.toString()),
        headers: {
          "authorization": "Bearer " + accessToken,
        }
    );

    List<dynamic> placesJson = json.decode(response.body);

    List<Place> places = placesJson.map((data) => Place.fromJson(data)).toList();

    return Future.value(places);

  }


}
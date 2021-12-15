import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mszczepienia_client/models/models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

const _base = "https://m-szczepienia.herokuapp.com/api/v1/";
const _loginURL = _base + "auth/login";
const _registerURL = _base + "auth/register";
DateFormat dayFormatter = DateFormat('yyyy-MM-dd');
DateFormat hourFormatter = DateFormat('HH:mm:ss');


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

  static Future<List<Disease>> getDiseaseSuggestions(String text) async {
    String accessToken = await getAccessToken();

    final response = await http.get(Uri.parse(_base + "disease?name=" + text),
        headers: {
          "authorization": "Bearer " + accessToken,
        }
    );

    List<dynamic> diseasesJson = json.decode(response.body);

    List<Disease> diseases = diseasesJson.map((data) => Disease.fromJson(data)).toList();

    return Future.value(diseases);

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

  static Future<List<Manufacturer>> getManufacturerSuggestions(int id) async {
    String accessToken = await getAccessToken();

    final response = await http.get(Uri.parse(_base + "vaccine?diseaseId=" + id.toString()),
        headers: {
          "authorization": "Bearer " + accessToken,
        }
    );

    List<dynamic> manufacturersJson = json.decode(response.body);

    List<Manufacturer> manufacturers = manufacturersJson.map((data) => Manufacturer.fromJson(data['manufacturer'])).toList();

    return Future.value(manufacturers);

  }

  //TODO: uncomment to make dots in calendar to show possible hours without choosing day
  // static Future<Map<DateTime, List<dynamic>>> getEventsMap(DateTime firstDate, DateTime lastDate, int placeId, int vaccineId) async{
  //
  //   List<DateTime> dates = [];
  //   List<List<dynamic>> values = [];
  //
  //   int datesDelta = lastDate.difference(firstDate).inDays;
  //
  //   firstDate = DateTime.parse(formatter.format(firstDate));
  //
  //   for(var i = 0; i < datesDelta; i++){
  //
  //     DateTime date = firstDate.add(Duration(days: i));
  //     List<dynamic> valuesForDay = await getAvailableHoursForDay(date, placeId, vaccineId);
  //
  //     dates.add(date);
  //     values.add(valuesForDay);
  //   }

  //   Map<DateTime, List<dynamic>> newMap = LinkedHashMap.fromIterables(dates, values);
  //
  //   return Future.value(newMap);
  // }

  static Future<List<String>> getAvailableHoursForDay(DateTime date, int placeId, int vaccineId) async {
    String accessToken = await getAccessToken();

    final response = await http.get(Uri.parse(_base + "visit/find?date="
        + dayFormatter.format(date)
        + "&placeId="
        + placeId.toString()
        + "&vaccineId="
        + vaccineId.toString()),
        headers: {
          "authorization": "Bearer " + accessToken,
        }
    );

    var responseJson = json.decode(response.body);

    List<dynamic> visitHours = responseJson['visitHours'];
    List<String> visitHoursString = visitHours.cast<String>();


    return Future.value(visitHoursString);
  }

  static Future<int> bookVisit(DateTime date, int placeId, int vaccineId, int patientId) async {
    int responseCode;

    Map data = {
      "date": dayFormatter.format(date),
      "time": hourFormatter.format(date),
      "placeId": placeId,
      "vaccineId": vaccineId,
      "patientId": patientId
    };

    final response = await http.post(Uri.parse(_base + "visit"),
        headers: {
          "Content-Type": "application/json",
          "authorization": "Bearer " + await getAccessToken(),
        },
      body: json.encode(data),
    );

    responseCode = response.statusCode;
    return responseCode; //add other response codes
  }


  static Future<List<Visit>> getVisitsWithStatus(int patientId, VisitStatus status) async {
    int responseCode;
    List<Visit> visits = [];

    final response = await http.get(Uri.parse(_base
        + "visit/history?patientId=" + patientId.toString()
        + "&statuses=" + status.toString().split('.').last
    ),
        headers: {
          "authorization" : "Bearer " + await getAccessToken(),
        });


    if(response.statusCode == 200) {
      List<dynamic> visitsJson = json.decode(response.body);
      visits = visitsJson.map((data) => Visit.fromJson(data)).toList();
      for(var visit in visits) {
        print(visit.localTime.toString());
      }
    } else {
      print(response.statusCode);
    }

    return visits;
  }



  static Future<bool> cancelVisit(int visitId) async {
    //TODO: fix
    final response = await http.put(Uri.parse(_base + "visit/cancel?visitId=" + visitId.toString()),
      headers: {
        "authorization": "Bearer " + await getAccessToken(),
      },
    );

    print(response.body);
    print(response.statusCode);

    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }

  }

}
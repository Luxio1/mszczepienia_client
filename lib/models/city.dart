import 'package:mszczepienia_client/models/voivodeship.dart';

class City {
  int id;
  String name;
  Voivodeship voivodeship;

  City({
    required this.id,
    required this.name,
    required this.voivodeship
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
        id: json['id'] as int,
        name: json['name'] as String,
        voivodeship: Voivodeship.fromJson(json['voivodeship'])
    );
  }
}
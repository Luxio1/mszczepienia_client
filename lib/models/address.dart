import 'models.dart';

class Address {
  int id;
  City city;
  String street;
  String number;

  Address({
    required this.id,
    required this.city,
    required this.street,
    required this.number
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        id: json['id'] as int,
        city: City.fromJson(json['city']),
        street: json['street'] as String,
        number: json['number'] as String);
  }
}
import 'models.dart';

class Place {
  int id;
  String name;
  Address address;

  Place({
    required this.id,
    required this.name,
    required this.address,});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
        id: json['id'] as int,
        name: json['name'] as String,
        address: Address.fromJson(json['address']),
    );
  }
}
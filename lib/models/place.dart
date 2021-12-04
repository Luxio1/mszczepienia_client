import 'models.dart';

class Place {
  int id;
  String name;
  Address address;
  List<PlaceVaccine> vaccines;
  List<WorkDay> workDays;

  //TODO: add moderator: User

  Place({
    required this.id,
    required this.name,
    required this.address,
    required this.vaccines,
    required this.workDays});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
        id: json['id'] as int,
        name: json['name'] as String,
        address: Address.fromJson(json['address']),
        vaccines: json['vaccines'].map((data) => PlaceVaccine.fromJson(data)).toList(), //TODO: ensure is it correct
        workDays: json['workDays'].map((data) => WorkDay.fromJson(data)).toList()  //TODO: ensure is it correct
    );
  }
}
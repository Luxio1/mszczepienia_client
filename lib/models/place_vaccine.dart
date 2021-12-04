import 'models.dart';

class PlaceVaccine {
  int id;
  Vaccine vaccine;
  Place place;
  int quantity;

  PlaceVaccine({
    required this.id,
    required this.vaccine,
    required this.place,
    required this.quantity
  });

  factory PlaceVaccine.fromJson(Map<String, dynamic> json) {
    return PlaceVaccine(
        id: json['id'] as int,
        vaccine: Vaccine.fromJson(json['vaccine']),
        place: Place.fromJson(json['place']),
        quantity: json['quantity'] as int
    );
  }
}
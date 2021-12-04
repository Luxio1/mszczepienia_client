import 'models.dart';

class Vaccine {
  int id;
  Manufacturer manufacturer;
  Disease disease;

  Vaccine({
    required this.id,
    required this.manufacturer,
    required this.disease
  });

  factory Vaccine.fromJson(Map<String, dynamic> json) {
    return Vaccine(id: json['id'] as int,
        manufacturer: Manufacturer.fromJson(json['manufacturer']),
        disease: Disease.fromJson(json['diseease']));
  }
}
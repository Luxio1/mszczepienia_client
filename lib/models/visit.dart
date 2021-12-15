import 'models.dart';

class Visit {
  int id;
  Place place;
  String localDate;
  String localTime;
  Vaccine vaccine;
  String status; //TODO: change to enum

  Visit({
    required this.id,
    required this.place,
    required this.localDate,
    required this.localTime,
    required this.vaccine,
    required this.status,
  });


  factory Visit.fromJson(Map<String, dynamic> json) {
    return Visit(
        id: json['id'] as int,
        place: Place.fromJson(json['place']),
        localDate: json['date'],
        localTime: json['time'],
        vaccine: Vaccine.fromJson(json['vaccine']),
        status: json['visitStatus']
    );
  }
}
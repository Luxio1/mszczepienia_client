import 'models.dart';

class Visit {
  int id;
  Place place;
  DateTime localDate;
  DateTime localTime;
  Vaccine vaccine;
  VisitStatus status;

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
        id: json['appointmentId'],
        place: json['place'],
  localDate: json['localDate'],
  localTime: json['localTime'],
  vaccine: json['vaccine'],
  status: json['status']
  );
    //TODO: set proper types in fromJson function (as String etc.)
}
}
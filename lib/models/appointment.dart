class Appointment {
  int id;
  String type;
  String manufacturer;
  String address;
  DateTime appointmentDate;



  Appointment.fromJson(Map<String, dynamic> json)
  : id = json['appointmentId'],
    type = json['vacType'],
    manufacturer = json['manufacturer'],
    address = json['address'],
    appointmentDate = json['date'];
}
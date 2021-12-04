import 'models.dart';

class WorkDay {
  int id;
  String weekDay; //TODO: change to enum
  //TODO: add opening hours
  //TODO: add closing hours


  WorkDay({
    required this.id,
    required this.weekDay,
  });

  factory WorkDay.fromJson(Map<String, dynamic> json) {
    return WorkDay(
        id: json['id'] as int,
        weekDay: json['weekDay'] as String,
    );
  }
}
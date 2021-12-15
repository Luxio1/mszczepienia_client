import 'package:mszczepienia_client/models/models.dart';

class Profile {
  final int id;
  final String email;
  final List<dynamic> roles;

  List<Patient> users;

  Patient get getMainPatient => users[0];

  Profile({
    required this.id,
    required this.email,
    required this.roles,
    required this.users,
  });

  factory Profile.fromJson(Map<String, dynamic> json, List<Patient> users) {
    return Profile(
      id: json['id'] as int,
      email: json['email'] as String,
      roles: json['roles'] as List<dynamic>,
      users: users,
    );
  }
}

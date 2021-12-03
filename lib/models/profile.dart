import 'package:mszczepienia_client/models/models.dart';

class Profile {
  final int id;
  final String email;
  final String accessToken; //TODO: keep accessToken in flutter_secure_storage for better safery
  final List<dynamic> roles;

  List<Patient> users;

  Profile({
    required this.id,
    required this.email,
    required this.accessToken,
    required this.roles,
    required this.users,
  });

  factory Profile.fromJson(Map<String, dynamic> json, List<Patient> users) {
    return Profile(
      id: json['id'] as int,
      email: json['email'] as String,
      accessToken: json['accessToken'] as String,
      roles: json['roles'] as List<dynamic>,
      users: users,
    );
  }
}

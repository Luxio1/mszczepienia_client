class User {
  final String firstName;
  final String lastName;
  final String pesel;
  final bool mainProfile; //TODO: change type

  User({
    required this.firstName,
    required this.lastName,
    required this.pesel,
    required this.mainProfile,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      pesel: json['pesel'] as String,
      mainProfile: json['mainProfile'] as bool,
    );
  }
}

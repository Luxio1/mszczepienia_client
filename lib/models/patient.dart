class Patient {
  final int id;
  final String firstName;
  final String lastName;
  final String pesel;
  final bool mainProfile;

  Patient({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.pesel,
    required this.mainProfile,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      pesel: json['pesel'] as String,
      mainProfile: json['mainProfile'] as bool,
    );
  }
}

class Patient {
  final String firstName;
  final String lastName;
  final String pesel;
  final bool mainProfile; //TODO: change type

  Patient({
    required this.firstName,
    required this.lastName,
    required this.pesel,
    required this.mainProfile,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      pesel: json['pesel'] as String,
      mainProfile: json['mainProfile'] as bool,
    );
  }
}

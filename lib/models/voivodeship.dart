class Voivodeship {
  int id;
  String name;

  Voivodeship({
    required this.id,
    required this.name
  });

  factory Voivodeship.fromJson(Map<String, dynamic> json) {
    return Voivodeship(
        id: json['id'] as int,
        name: json['name'] as String);
  }
}
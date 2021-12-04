class Manufacturer {
  int id;
  String name;

  Manufacturer({
    required this.id,
    required this.name,
});

  factory Manufacturer.fromJson(Map<String, dynamic> json) {
    return Manufacturer(
        id: json['id'] as int,
        name: json['name'] as String);
  }

}
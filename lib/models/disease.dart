class Disease {
  int id;
  String name;

  Disease({
    required this.id,
    required this.name,
});

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
        id: json['id'],
        name: json['name']
    );
  }
}
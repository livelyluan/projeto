class Collection {
  final String name;

  Collection({
    required this.name,
  });
  Map<String, Object?> toMap() => {
    'name': name
  };
  factory Collection.fromMap(Map<String, dynamic> mapa) {
   return Collection(
    name: mapa['name'],
   );
  }
}
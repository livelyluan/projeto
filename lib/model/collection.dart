class Collection {
  int? id;
  final String name;

  Collection({
    this.id,
    required this.name,
  });
  Map<String, Object?> toMap() => {
    'id': id,
    'name': name
  };
  factory Collection.fromMap(Map<String, Object?> mapa) {
   return Collection(
    id: mapa['id'] as int,
    name: mapa['name'] as String,
   );
  }
}
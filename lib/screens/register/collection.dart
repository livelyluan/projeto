class Collection {
  final String name;

  Collection({
    required this.name,
  });
  Map<String, Object?> toMap() => {
    'name': name
  };
}
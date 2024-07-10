class Book {
  int? id;
  final String title;
  final String subtitle;
  final String author;
  final String publisher;
  final int volume;
  final int publicationYear;

  Book({
    this.id,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publisher,
    required this.volume,
    required this.publicationYear,
  });
}

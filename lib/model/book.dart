class Book {
  final String title;
  final String author;
  String? publisher;
  final String volume;
  String? publicationYear;

  Book({
    required this.title,
    required this.author,
    this.publisher,
    required this.volume,
    this.publicationYear,
  });

  Map<String, Object?> toMap() => {
    'title': title,
    'author': author,
    'publisher': publisher,
    'volume': volume,
    'publicationYear': publicationYear,
  };
 
  }


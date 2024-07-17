class Book {
  final String title;
  final String author;
  final String publisher;
  final int volume;
  final int publicationYear;

  Book({
    required this.title,
    required this.author,
    required this.publisher,
    required this.volume,
    required this.publicationYear,
  });

  Map<String, Object?> toMap() => {
    'title': title,
    'author': author,
    'publisher': publisher,
    'volume': volume,
    'publicationYear': publicationYear,
  };
  }


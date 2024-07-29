
class Book {
  final int id;
  final String title;
  final String author;
  final String? publisher;
  final String volume;
  final String? publicationYear;

  Book({
    required this.id,
    required this.title,
    required this.author,
    this.publisher,
    required this.volume,
    this.publicationYear,
  });
  
  Map<String, Object?> toMap() => {
    'id': id,
    'title': title,
    'author': author,
    'publisher': publisher,
    'volume': volume,
    'publicationYear': publicationYear,
  };
   factory Book.fromMap(Map<String, dynamic> mapa) {
    return Book(
      id: mapa['id'],
      title: mapa['title'],
       author: mapa['author'],
       publisher: mapa['publisher'],
        volume: mapa['volume'],
        publicationYear: mapa['publicationYear'],
        );
  }
  }


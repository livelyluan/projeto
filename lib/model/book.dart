
class Book {
  int? id;
  final String title;
  final String author;
  final String? publisher;
  final String volume;
  final String? publicationYear;

  Book({
    this.id,
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
   factory Book.fromMap(Map<String, Object?> mapa) {
    return Book(
      id: mapa['id'] as int?,
      title: mapa['title'] as String,
       author: mapa['author'] as String,
       publisher: mapa['publisher'] as String,
        volume: mapa['volume'] as String,
        publicationYear: mapa['publicationYear'] as String,
        );
  }
  }


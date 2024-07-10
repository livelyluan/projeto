import 'package:flutter/foundation.dart';

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

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      subtitle: map['subtitle'],
      author: map['author'],
      publisher: map['publisher'],
      volume: map['volume'],
      publicationYear: map['publicationYear']
    );
  }

}

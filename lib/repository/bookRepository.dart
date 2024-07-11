import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:book_finder/model/book.dart';
import 'package:book_finder/database/db.dart';

class BookRepository extends ChangeNotifier {
  late Database db;
  List<Book> _book = [];

  BookRepository() {
    _initRepository();
  }

  _initRepository() async {
    await _getBook();
  }

  _getBook() async {
  _book = [];
  List bookDb = await db.query('books');
  bookDb.forEach((book) {
    _book.add(Book.fromMap({
      'id': book['id'],
      'title': book['title'],
      'subtitle': book['subtitle'],
      'authorName': book['author_name'],
      'publisher': book['publisher_name'],
      'volume': book['volume'],
      'publicationYear': book['publicationYear'],
    }));
  });
  notifyListeners();
}
addBook(Book book) async {
    db = await DB.instance.database;
    await db.insert('book', {
      'title': book.title,
      'subtitle': book.subtitle,
      'authorName': book.author,
      'publisher': book.publisher,
      'volume': book.volume,
      'publicationYear': book.publicationYear,
    });
    await _getBook();
    notifyListeners();
  }
}

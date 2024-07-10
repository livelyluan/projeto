import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:book_finder/model/book.dart';

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
    List operacoes = await db.query('Book');
    
  }
}

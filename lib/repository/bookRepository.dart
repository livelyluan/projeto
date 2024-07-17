import 'package:book_finder/database/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:book_finder/model/book.dart';


class BookRepository with ChangeNotifier {
  late Database _db;
  List<Book> _books = [];

  BookRepository() {
    _initRepository();
  }

  _initRepository() async {
    _db = await DbHelper.openConnection();
    await _getBooks();
  }

  _getBooks() async {
    _books = [];
    List<Map<String, dynamic>> booksDb = await _db.query('books');
    booksDb.forEach((book) {
      _books.add(Book.fromMap(book));
    });
    notifyListeners();
  }

  addBook(Book book) async {
    try {
      await _db.insert('books', {
        'title': book.title,
        'author_name': book.author,
        'publisher_name': book.publisher,
        'volume': book.volume,
        'publicationYear': book.publicationYear,
      });
      await _getBooks();
      notifyListeners();
    } catch (e) {
      print('Erro ao adicionar livro: $e');
    }
  }
  updateBook(Book book) async {
  try {
    await _db.update('books', {
      'title': book.title,
      'author_name': book.author,
      'publisher_name': book.publisher,
      'volume': book.volume,
      'publicationYear': book.publicationYear,
    }, where: 'id = ?', whereArgs: [book.id]);
    await _getBooks();
    notifyListeners();
  } catch (e) {
    print('Erro ao atualizar livro: $e');
  }
  deleteBook(int id) async {
    try {
      await _db.delete('books', where: 'id = ?', whereArgs: [id]);
      await _getBooks();
      notifyListeners();
    } catch (e) {
      print('Erro ao deletar livro');
    }
  }
  Future<List<Book>> searchBooks(String query) async {
  List<Map<String, dynamic>> booksDb = await _db.query('books', where: 'title LIKE ? OR author_name LIKE ?', whereArgs: ['%$query%', '%$query%']);
  return booksDb.map((book) => Book.fromMap(book)).toList();
}
Future<List<Book>> getAllBooks() async {
  List<Map<String, dynamic>> booksDb = await _db.query('books');
  return booksDb.map((book) => Book.fromMap(book)).toList();
}
  }


}

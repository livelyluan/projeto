import 'package:book_finder/database/db_helper.dart';
import 'package:book_finder/model/book.dart';

class BookRepository {
  static Future<int> insert(Book book) async {
  final db = await DbHelper.openConnection();
  return db.insert('books', book.toMap());
  }
}
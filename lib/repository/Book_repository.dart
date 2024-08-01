import 'package:book_finder/database/db_helper.dart';
import 'package:book_finder/model/book.dart';

class BookRepository {
  static Future<int> insert(Book book) async {
  final db = await DbHelper.openConnection();
  return db.insert('livros', book.toMap());
  }

  static Future<List<Book>> findBook() async {
    final db = await DbHelper.openConnection();
    // select * from books
    final result = await db.query('livros');
    return result.map((item) => Book.fromMap(item)).toList();
  }

  static Future<int> remove(int id) async {
  final db = await DbHelper.openConnection();
  return await db.delete(
    'livros',
    where: 'id = ?',
    whereArgs: [id],
  );
 }

  static Future<int> adjust(Book book) async {
  final db = await DbHelper.openConnection();
  return db.update(
    'livros',
     book.toMap(),
     where: 'id = ?',
     );
 }
 


}

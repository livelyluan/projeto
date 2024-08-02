import 'package:book_finder/database/db_helper.dart';
import 'package:book_finder/model/book.dart';

class BookRepository {
  //salvar
  static Future<int> insert(Book book) async {
  final db = await DbHelper.openConnection();
  return db.insert('livros', book.toMap());
  }
//listar
  static Future<List<Book>> findBook() async {
    final db = await DbHelper.openConnection();
    // select * from books
    final result = await db.query('livros');
    return result.map((item) => Book.fromMap(item)).toList();
  }

//remover
  static Future<int> removeBook(int id) async {
  final db = await DbHelper.openConnection();
  return await db.delete(
    'livros',
    where: 'id = ?',
    whereArgs: [id],
  );
 }

//atualizar
  static Future<int> adjust(Book book) async {
  final db = await DbHelper.openConnection();
  return db.update(
    'livros',
     book.toMap(),
     where: 'id = ?',
     );
 }

//pesquisar (em construção)
 static Future<List<Book>> searchBooks(String title) async {
    final db = await DbHelper.openConnection();
    final result = await db.query(
      'livros',
        where: 'title LIKE?',
        whereArgs: ['%$title%']);
    return result.map((item) => Book.fromMap(item)).toList();
  }
  
}

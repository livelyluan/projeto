import 'package:book_finder/database/db_helper.dart';
import 'package:book_finder/model/book.dart';

//inserindo
class BookRepository {

  //salvar
  static Future<int> insert(Book book) async {
  final db = await DbHelper.openConnection();
  return db.insert('livros', book.toMap());
  }

//listar
static Future<List<Book>> findBook() async {
    final db = await DbHelper.openConnection();
    // select * from livros
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

  // Buscar um livro por ID
static Future<Book?> findBookId(int? id) async {
  final db = await DbHelper.openConnection();
  final result = await db.query(
    'livros',
    where: 'id = ?',
    whereArgs: [id],
  );
  if (result.isNotEmpty) {
    return Book.fromMap(result.first);
  } else {
    return null;
  }
}
  
}

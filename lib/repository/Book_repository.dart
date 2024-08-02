import 'package:book_finder/database/db_helper.dart';
import 'package:book_finder/model/book.dart';

//inserindo
class BookRepository {
  //salvar
  static Future<int> insert(Book book) async {
  final db = await DbHelper.openConnection();
  return db.insert('livros', book.toMap());
  }
<<<<<<< HEAD
//listar
  static Future<List<Book>> findBook() async {
=======

//listando
 Future<List<Book>> getBook() async {
  try {
>>>>>>> 107cbabd386c40f54a297d0a06e8d60c8287f9af
    final db = await DbHelper.openConnection();
    final List<Map<String, dynamic>> maps = await db.query('livros');
    if (maps.isEmpty) {
      return [];
    }
    return List.generate(
      maps.length,
      (i) {
        if (!maps[i].containsKey('title') || !maps[i].containsKey('author') ||
            !maps[i].containsKey('publisher') || !maps[i].containsKey('volume') ||
            !maps[i].containsKey('publicationYear')) {
          throw Exception('Dados insuficientes para criar um livro.');
        }
        return Book.fromMap({
          'title': maps[i]['title'],
          'author': maps[i]['author'],
          'publisher': maps[i]['publisher'],
          'volume': maps[i]['volume'],
          'publicationYear': maps[i]['publicationYear']
        });
      }
    );
  } catch (ex) {
    print(ex);
  }
  return [];
  }

<<<<<<< HEAD
//remover
  static Future<int> removeBook(int id) async {
=======
 static Future<void> deleteBook(int id) async {
>>>>>>> 107cbabd386c40f54a297d0a06e8d60c8287f9af
  final db = await DbHelper.openConnection();
  await db.delete('livros', where: 'id = ?', whereArgs: [id]);
 }

<<<<<<< HEAD
//atualizar
  static Future<int> adjust(Book book) async {
=======
 static Future<int> updateBook(Book book) async {
>>>>>>> 107cbabd386c40f54a297d0a06e8d60c8287f9af
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

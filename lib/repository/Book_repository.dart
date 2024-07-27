import 'package:book_finder/database/db_helper.dart';
import 'package:book_finder/model/book.dart';

//inserindo
class BookRepository {
  static Future<int> insert(Book book) async {
  final db = await DbHelper.openConnection();
  return db.insert('books', book.toMap());
  }

//listando
 Future<List<Book>> getBook() async {
  try {
    final db = await DbHelper.openConnection();
    final List<Map<String, dynamic>> maps = await db.query('books');
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

 static Future<void> delete(int id) async {
  final db = await DbHelper.openConnection();
  await db.delete('books', where: 'id = ?', whereArgs: [id]);
 }



}

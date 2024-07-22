import 'package:book_finder/database/db_helper.dart';
import 'package:book_finder/model/book.dart';

class BookRepository {
  static Future<int> insert(Book book) async {
  final db = await DbHelper.openConnection();
  return db.insert('books', book.toMap());
  }
  static Future<List<Book>> getAll()  async {
    final db = await DbHelper.openConnection();
    final List<Map<String, dynamic>> maps = await db.query('books');
    return maps.map((map) => Book(
          title: map['title'],
          author: map['author'],
          publisher: map['publisher'],
          volume: map['volume'],
          publicationYear: map['publicationYear'],
        )).toList();
  }
}

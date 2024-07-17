import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> openConnection() async {
    var path = await getDatabasesPath();
    var dbName = 'bookFinder_database.db';
    var dbPath = '$path$dbName';
    return await openDatabase(
      dbPath,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE books(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT PRIMARY KEY,
            author_name TEXT,
            publisher_name TEXT,
            volume INTEGER,
            publicationYear INTEGER
          )
        ''');
      },
      version: 1,
    );
  }
}
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> openConnection() async {
    var path = await getDatabasesPath();
    var dbName = 'bookfinder_database.db';
    var dbPath = '$path$dbName';
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
            await db.execute(
              'CREATE TABLE leavebook (title TEXT PRIMARY KEY, userName TEXT, studentName TEXT, checkoutDate DATETIME, returnDate DATETIME)');
               await db.execute(
              'CREATE TABLE collection (name CHAR PRIMARY KEY)');
              await db.execute(
                'CREATE TABLE livros (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL,author TEXT NOT NULL,publisher CHAR NOT NULL,volume CHAR(2) NOT NULL,publicationYear CHAR(4) NOT NULL)');
      },
    );
  }
}

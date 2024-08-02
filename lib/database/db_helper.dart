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
              'CREATE TABLE leavebook (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, userName TEXT NOT NULL, studentName TEXT NOT NULL, checkoutDate DATETIME NOT NULL, returnDate DATETIME NOT NULL)');
               await db.execute(
              'CREATE TABLE collection (id INTEGER PRIMARY KEY AUTOINCREMENT, name CHAR NOT NULL)');
              await db.execute(
                'CREATE TABLE livros (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL,author TEXT NOT NULL,publisher CHAR NOT NULL,volume CHAR(2) NOT NULL,publicationYear CHAR(4) NOT NULL)');
      },
    );
  }
}

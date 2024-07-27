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
            'CREATE TABLE books (title TEXT PRIMARY KEY,author TEXT ,publisher CHAR,volume CHAR(2),publicationYear CHAR(4));');
            await db.execute(
              'CREATE TABLE leavebook (title TEXT PRIMARY KEY, userName TEXT, studentName TEXT, checkoutDate DATETIME, returnDate DATETIME)');
               await db.execute(
              'CREATE TABLE collection (name CHAR PRIMARY KEY)');
      },
    );
  }
}

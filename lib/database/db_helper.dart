import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> openConnection() async {
    var path = await getDatabasesPath();
    var dbName = 'bookfinder_database.db';
    var dbPath = '$path$dbName';
    return await openDatabase(
      dbPath,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE books (title CHAR PRIMARY KEY,author CHAR ,publisher CHAR,volume CHAR(2),publicationYear CHAR(4));');
            await db.execute(
              'CREATE TABLE leavebook (title CHAR PRIMARY KEY, userName CHAR, clientName CHAR, checkoutDate CHAR, returnDate CHAR,)');
               await db.execute(
              'CREATE TABLE collection (collection CHAR PRIMARY KEY)');
      },
      version: 1,
    );
    
  }
}

import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> openConnection() async {
    var path = await getDatabasesPath();
    var dbName = 'parking_database.db';
    var dbPath = '$path$dbName';
    return await openDatabase(
      dbPath,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE tickets (title CHAR PRIMARY KEY,author CHAR ,publisher CHAR,volume CHAR(2),publicationYear CHAR(4));');
      },
    );
  }
}

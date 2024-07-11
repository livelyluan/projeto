import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();
 static final DB instance = DB._();

 static Database? _database;

get dataBase async {
  if(_database != null) return _database;

  return await _initDataBase;
}

_initDataBase() async {
  return await openDatabase(
    join(await getDatabasesPath(), 'Biblioteca.db'),
    version: 1,
    onCreate: _onCreate,
  );
}

_onCreate(db, versao) async {
  await db.execute(_book);

}

String get _book => '''
CREATE TABLE book (
 title TEXT PRIMARY KEY,
 subtitle TEXT,
 author TEXT,
 publisher TEXT,
 volume INTEGER,
 publicationYear INTEGER,
 );
''';
 }

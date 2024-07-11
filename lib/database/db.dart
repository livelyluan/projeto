import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DB {
  // Construtor com acesso privado
  DB._();
  // Criar uma instancia de DB
  static final DB instance = DB._();
  //Instancia do SQLite
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'biblioteca.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_book);
    await db.execute(_collection);
    await db.execute(_register);
    await db.insert('book');
  }

  String get _book => '''
  CREATE TABLE book (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT PRIMARY KEY,
  subtitle TEXT,
  author TEXT,
  publisher TEXT,
  volume INTEGER,
  publicationYear INTEGER,
    );
  ''';

  String get _collection => '''
   
    );
  ''';

  String get _register => '''
    CREATE TABLE historico (
      
    );
  ''';
}
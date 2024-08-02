import 'package:book_finder/database/db_helper.dart';
import 'package:book_finder/model/collection.dart';

class CollectionRepository {

  //salvar
static Future<int> insert(Collection collection) async {
    final db = await DbHelper.openConnection();
    return db.insert('collection', collection.toMap());
}

//listar
static Future<List<Collection>> findCollection() async {
    final db = await DbHelper.openConnection();
    // select * from collection
    final result = await db.query('collection');
    return result.map((item) => Collection.fromMap(item)).toList();
  }


//remover
  static Future<int> removeCollection(int id) async {
  final db = await DbHelper.openConnection();
  return await db.delete(
    'collection',
    where: 'id = ?',
    whereArgs: [id],
  );
 }
}
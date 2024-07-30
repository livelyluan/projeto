import 'package:book_finder/database/db_helper.dart';
import 'package:book_finder/model/collection.dart';

class CollectionRepository {
static Future<int> insert(Collection collection) async {
    final db = await DbHelper.openConnection();
    return db.insert('collection', collection.toMap());
}

Future<List<Collection>> findCollection() async {
  try {
    final db = await DbHelper.openConnection();
    final List<Map<String, dynamic>> maps = await db.query('collection');
    if (maps.isEmpty) {
      return [];
    }
    return List.generate(
      maps.length,
      (i) {
        if (!maps[i].containsKey('name')) {
          throw Exception('Dados insuficientes para criar uma coleção.');
        }
        return Collection.fromMap({
          'name': maps[i]['name'],
        });
      }
    );
  } catch (ex) {
    print(ex);
  }
  return [];
  }
}
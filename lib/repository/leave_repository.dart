import 'package:book_finder/database/db_helper.dart';
import 'package:book_finder/model/register_leave.dart';

class CheckoutRepository {

  //salvar
  static Future<int> insert(CheckoutBook checkoutBook) async {
  final db = await DbHelper.openConnection();
  return db.insert('leavebook', checkoutBook.toMap());
  }

  //listar
  static Future<List<CheckoutBook>> findLeaves() async {
    final db = await DbHelper.openConnection();
    // select * from collection
    final result = await db.query('leaveBook');
    return result.map((item) => CheckoutBook.fromMap(item)).toList();
  }

//remover
  static Future<int> removeLeave(int id) async {
    final db = await DbHelper.openConnection();
    return await db.delete(
      'leavebook',
      where: 'id = ?',
      whereArgs: [id]
      );
  }
}
import 'package:book_finder/database/db_helper.dart';
import 'package:book_finder/model/register_leave.dart';

class CheckoutRepository {
  static Future<int> insert(CheckoutBook checkoutBook) async {
  final db = await DbHelper.openConnection();
  return db.insert('leavebook', checkoutBook.toMap());
  }

 Future<List<CheckoutBook>> getLeaves() async {
  try {
   final db = await DbHelper.openConnection();
   final List<Map<String, dynamic>> maps = await db.query('leavebook');
   if (maps.isEmpty) {
    return [];
   }
   return List.generate(
    maps.length,
    (i) {
      if (!maps[i].containsKey('title') || !maps[i].containsKey('userName') ||
            !maps[i].containsKey('studentName') || !maps[i].containsKey('checkoutDate') ||
            !maps[i].containsKey('returnDate')) {
              throw Exception('Dados insuficientes para registrar uma saida.');
            }
            return CheckoutBook.fromMap({
              'title': maps[i]['title'],
          'userName': maps[i]['userName'],
          'studentName': maps[i]['studentName'],
          'checkoutDate': maps[i]['checkoutDate'],
          'returnDate': maps[i]['returnDate']
            });
    }
   );
  } catch (ex) {
    print(ex);
  }
  return [];
 }
}
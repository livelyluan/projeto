import 'package:book_finder/database/db_helper.dart';

import 'package:book_finder/model/register_leave.dart';

class CheckoutRepository {
  static Future<int> insert(CheckoutBook CheckoutBook) async {
  final db = await DbHelper.openConnection();
  return db.insert('leavebook', CheckoutBook.toMap());
  }
}
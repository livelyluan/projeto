import 'package:book_finder/model/register.dart';
import 'package:flutter/material.dart';

class BookReturn extends StatelessWidget {
  final CheckoutBook checkoutBook;
  const BookReturn({super.key, required this.checkoutBook});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Card(
    margin: const  EdgeInsets.symmetric(vertical: 2.0),
    child: Row(
      children: [
      Expanded(
       child: ListTile(
          title:  Text(checkoutBook.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24,)),
          subtitle: Text(checkoutBook.returnDate, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18)), 
          ),
        ),
        PopupMenuButton(itemBuilder: (context) => [
         const PopupMenuItem(child: ListTile(
          leading: Icon(Icons.delete, size: 24,),
          title: Text('Remover', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
         )),
       const  PopupMenuItem(child: ListTile(
          leading: Icon(Icons.edit, size: 24,),
          title: Text('Editar',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
         ))
        ]),
        Image.asset(
          'assets/images/biblioteca.png',
          width: 100,
        )
       ],
      ),
     ),
    );
  }
}
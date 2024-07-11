import 'package:book_finder/model/collection.dart';
import 'package:flutter/material.dart';

class BookCollection extends StatelessWidget {
  final Collection collection;
  const BookCollection({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text(collection.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              ),
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
             const PopupMenuItem(child: ListTile(
                leading: Icon(Icons.delete),
                title: Text('Remover', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
                 ),
                ),
               const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Renomear', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
                    ),
                 ),
               ],
             ),
            Image.asset(
              'assets/images/collection.png',
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
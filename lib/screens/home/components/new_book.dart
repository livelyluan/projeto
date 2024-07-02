import 'package:flutter/material.dart';
import 'package:book_finder/model/book.dart';


class NewBook extends StatelessWidget {
  final Book book;
  const NewBook({
    super.key,
    required this.book,
    });

  @override
  Widget build(BuildContext context) {
    return  Padding(
  padding: const EdgeInsets.symmetric(vertical: 6.0),
  child: Card(
    margin: const EdgeInsets.symmetric(vertical: 2.0),
    child: Row(
      children: [
     const Expanded(
       child: ListTile(
          title: Text('title', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
          subtitle: Text('subtitle', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
        ),
        ),
        PopupMenuButton(itemBuilder: (context) =>  [
        const  PopupMenuItem(
            child: Text('Editar')
            ),
            const  PopupMenuItem(
            child: Text('Remover')
            ),
        ]),
        Image.asset(
       'assets/images/livros.png',
       width: 100,
       
        ),
      ],
      
    ),
  ),
    );
  }
}
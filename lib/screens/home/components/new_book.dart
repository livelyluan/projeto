import 'package:book_finder/repository/book_repository.dart';
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
  child: GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'bookInfo');
    },
    child: Card(
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
        Expanded(
         child: ListTile(
            title:  Text(book.title, style: const TextStyle(fontWeight: FontWeight.w500,fontStyle: FontStyle.italic, fontSize: 18)),
            subtitle: Text(book.author, style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
          ),
          ),
          PopupMenuButton<String>(
            itemBuilder: (context) =>  [
            PopupMenuItem(
              child: const ListTile(
                leading: Icon(Icons.delete, size: 24),
                title: Text('Remover', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
              ),
              onTap: () async {
                final result = await BookRepository.remove(book.id!);
                SnackBar snackBar;
                if (result != 0) {
                  snackBar = const SnackBar(content: Text('amem'));
                } else {
                  snackBar = const SnackBar(content: Text('chora mais'));
                } ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } ,
              ),
              const  PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.edit,size: 24),
                title: Text('Editar', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
              ),
              ),
          ]),
          Image.asset(
         'assets/images/livros.png',
         width: 100,
          ),
        ],
      ),
    ),
  ),
    );
  }
}
import 'package:book_finder/repository/Book_repository.dart';
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
    return  Container(
      
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
           'bookInfo',
           arguments: book.id
           );
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
                  final result = await BookRepository.removeBook(book.id!);
                  SnackBar snackBar;
                  if (result != 0) {
                    snackBar = const SnackBar(content: Text('O livro foi removido com sucesso!!!'));
                  } else {
                    snackBar = const SnackBar(content: Text('Erro ao remover livro. Por favor, tente novamente mais tarde'));
                  } ScaffoldMessenger.of(context).showSnackBar(snackBar);
                 } ,
                ),
                  PopupMenuItem(
                child: const ListTile(
                  leading: Icon(Icons.edit,size: 24),
                  title: Text('Editar', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'bookEdit', arguments: book.id);
                },
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
      ),
    );
  }
}
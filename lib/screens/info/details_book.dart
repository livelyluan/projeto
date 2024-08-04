import 'package:book_finder/model/book.dart';
import 'package:book_finder/repository/book_repository.dart';
import 'package:book_finder/screens/info/componentes/info_book.dart';
import 'package:book_finder/screens/shared/new_appbar.dart';
import 'package:flutter/material.dart';

class BookInfo extends StatelessWidget {

  final int? bookId;

 BookInfo({super.key, required this.bookId});
 
final bookRepository = BookRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar('informações', context),
      body: FutureBuilder<Book?>(
        future: BookRepository.findBookId(bookId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Erro ao carregar o livro');
          } else {
            var book = snapshot.data;
            return Card(
             color: Colors.grey[600],
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => InfoBook(book: book!),
              ),
            );
          }
        },
      ),
    );
  }
}


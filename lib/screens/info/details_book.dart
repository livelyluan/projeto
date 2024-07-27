import 'package:book_finder/model/book.dart';
import 'package:book_finder/repository/book_repository.dart';
import 'package:book_finder/screens/info/componentes/info_book.dart';
import 'package:book_finder/screens/shared/new_appbar.dart';
import 'package:flutter/material.dart';

class BookInfo extends StatelessWidget {
 BookInfo({super.key});

final bookRepository = BookRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar('informações', context),
      body: Card(
      child:  ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => InfoBook(book: book),
       )
        ),
    );
  }
}
var book = Book(title: 'One piece', author: 'eichiro oda', publisher: 'shounenJump', volume: '1', publicationYear: '1997');

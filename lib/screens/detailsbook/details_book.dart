import 'package:book_finder/model/book.dart';
import 'package:book_finder/screens/detailsbook/componentes/info_book.dart';
import 'package:book_finder/screens/shared/new_appbar.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatefulWidget {

  const BookDetailsScreen({super.key});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}
var book = Book(title: 'One piece', author: 'eichiro oda', publisher: 'shounenJump', volume: '1', publicationYear: '1997');

class _BookDetailsScreenState extends State<BookDetailsScreen> {
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

import 'package:book_finder/model/book.dart';
import 'package:book_finder/screens/home/components/new_book.dart';
import 'package:book_finder/screens/shared/new_appbar.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  final List<Book> searchResult;

  const SearchResult({super.key, required this.searchResult});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: NewAppBar('Resultado', context),
      body: ListView.builder(
        itemCount: searchResult.length,
        itemBuilder: (context, index) {
          return NewBook(book: searchResult[index]);
        }
      
       ),
    );
  }
}

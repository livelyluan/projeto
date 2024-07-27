import 'package:book_finder/model/book.dart';
import 'package:flutter/material.dart';


class InfoBook extends StatelessWidget {
  final Book book;
  const InfoBook({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Column(
          children: [
            Text(book.title),
            Text(book.author),
            Text('${book.publisher}'),
            Text(book.volume),
            Text('Ano de Lançamento ${book.publicationYear}')
          ],
        ),
      ),
    );
  }
}
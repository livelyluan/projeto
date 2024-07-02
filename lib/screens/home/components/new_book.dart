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
  padding: const EdgeInsets.symmetric(vertical: 16.0),
  child: Card(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Expanded(
       child: ListTile(
          title: Text(book.title),
          subtitle: Text(book.subtitle),
        ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
      ],
    ),
  ),
    );
  }
}
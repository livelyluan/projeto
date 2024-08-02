import 'package:book_finder/model/book.dart';
import 'package:book_finder/repository/Book_repository.dart';
import 'package:flutter/material.dart';


class ResultsScreen extends StatelessWidget {
  final String searchText;

  ResultsScreen({Key? key, required this.searchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
      future: BookRepository.searchBooks(searchText),
      builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro ao buscar livros'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data![index].title),
                onTap: () {},
              );
            },
          );
        }
      },
    );
  }
}


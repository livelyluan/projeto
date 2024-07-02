import 'package:book_finder/screens/home/components/new_book.dart';
import 'package:book_finder/screens/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:book_finder/model/book.dart';
class Home extends StatelessWidget {
 const Home({super.key});

  @override
  Widget build(BuildContext context) {

  var book = Book(
    title: 'harry potter',
    subtitle: 'e as reliquias da morte',
     author: 'j.k',
      publisher: 'fulana',
       volume: 7,
        publicationYear: 1997);
    return  DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: Custom_AppBar(100.0,const Color(0xFF4B7C82)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'new_book');
          },
          tooltip: 'Adicionar um novo livro',
          child: const Icon(Icons.add),
          ),
          body: Expanded(
            child: ListView.builder(
           itemCount: 8,
           itemBuilder: (context, index) => NewBook(book: book,),
            ),
          ),
          
      ), 
      );
  }
}

import 'package:book_finder/model/collection.dart';
import 'package:book_finder/model/register_leave.dart';
import 'package:book_finder/screens/home/components/book_collection.dart';
import 'package:book_finder/screens/home/components/book_leave.dart';
import 'package:book_finder/screens/home/components/new_book.dart';
import 'package:book_finder/screens/home/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:book_finder/model/book.dart';
class Home extends StatelessWidget {
 const Home({super.key});

  @override
  Widget build(BuildContext context) {
  
  var book = Book(
    title: 'harry potter e a pedra filosofal',
     author: 'j.k rowling',
      publisher: 'Bloomsbury Publishing Rocco Presença',
       volume: '1',
        publicationYear: '1997');


    var collection = Collection(name: 'Coleção ');

  var checkoutBook = CheckoutBook(
    title: 'parcy jackson', 
    userName: 'luan', 
    clientName: 'fulano',
    checkoutDate: '06/07/2024', 
    returnDate: '12/07/2024',
    );

    return  DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: Custom_AppBar(context,100.0,const Color(0xFF4B7C82)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'register');
          },
          tooltip: 'Adicionar um novo livro',
          child: const Icon(Icons.add),
          ),
          body: TabBarView(
            children:[ Expanded(
              child: ListView.builder(
             itemCount: 2,
             itemBuilder: (context, index) => NewBook(book: book),
              ),
            ),
             Expanded(child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) => BookCollection(collection: collection)
             )),
             
           Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) => BookReturn(checkoutBook: checkoutBook)),
         ),
       ],
      ),
    ), 
   );
  }
}

import 'package:book_finder/model/collection.dart';
import 'package:book_finder/model/register_leave.dart';
import 'package:book_finder/repository/book_repository.dart';
import 'package:book_finder/screens/home/components/book_collection.dart';
import 'package:book_finder/screens/home/components/book_leave.dart';
import 'package:book_finder/screens/home/components/new_book.dart';
import 'package:book_finder/screens/home/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:book_finder/model/book.dart';
class Home extends StatelessWidget {
  Home({super.key});

 final bookRepository = BookRepository();

  @override
  Widget build(BuildContext context) {
        
    var collection = Collection(name: 'Coleção ');

  var checkoutBook = CheckoutBook(
    title: 'percy jackson', 
    userName: 'luan', 
    studentName: 'fulano',
    checkoutDate: '06/07/2024', 
    returnDate: '12/07/2024',
    );

    return  DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: Custom_AppBar(context,100.0,),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'register');
          },
          tooltip: 'Adicionar um novo livro',
          child: const Icon(Icons.add),
          ),
          body: TabBarView(
            children:[
               FutureBuilder<List<Book>>(
                future: bookRepository.getBook(),
                builder: (context, snapshot) { 
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('erro ao carrehar livros'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) => NewBook(book: snapshot.data![index]),
                    );
                  }
                },
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

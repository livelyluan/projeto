import 'package:book_finder/model/collection.dart';
import 'package:book_finder/model/register_leave.dart';
import 'package:book_finder/repository/book_repository.dart';
import 'package:book_finder/repository/collection_repository.dart';
import 'package:book_finder/repository/leave_repository.dart';
import 'package:book_finder/screens/home/components/book_collection.dart';
import 'package:book_finder/screens/home/components/book_leave.dart';
import 'package:book_finder/screens/home/components/new_book.dart';
import 'package:book_finder/screens/home/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:book_finder/model/book.dart';
class Home extends StatelessWidget {
  Home({super.key});

<<<<<<< HEAD
=======
 final bookRepository = BookRepository();
 final checkoutRepository = CheckoutRepository();
 final collectionRepository = CollectionRepository();
 

>>>>>>> 107cbabd386c40f54a297d0a06e8d60c8287f9af
  @override
  Widget build(BuildContext context) {

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
              //livros
               FutureBuilder<List<Book>>(
                future: bookRepository.getBook(),
                builder: (context, snapshot) { 
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('erro ao carregar livros'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) => NewBook(book: snapshot.data![index],
                      ),
                    );
                  }
                },
            ),
             //coleção
              FutureBuilder<List<Collection>>(
                future: CollectionRepository.findCollection(),
                builder: (context, snapshot) { 
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('erro ao carregar livros'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) => BookCollection(collection: snapshot.data![index],
                      ),
                    );
                  }
                },
            ),
             //retirada
          FutureBuilder<List<CheckoutBook>>(
                future: CheckoutRepository.findLeaves(),
                builder: (context, snapshot) { 
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('erro ao carregar saida'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) => BookReturn(checkoutBook: snapshot.data![index]),
                    );
                  }
                },
            ),
       ],
      ),
    ), 
   );
  }
}

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
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 final bookRepository = BookRepository();

 final checkoutRepository = CheckoutRepository();

 final collectionRepository = CollectionRepository();

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
                  if (snapshot.connectionState == ConnectionState.none ||
                    snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('erro ao carregar livros'));
                  } else { 
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                     return const Center(child: Text('No momento, não há livros disponíveis.'),);
                    } else {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) => NewBook(book: snapshot.data![index],), 
                    );
                  }
                }
                },
            ),
             //coleção
              FutureBuilder<List<Collection>>(
                future: collectionRepository.findCollection(),
                builder: (context, snapshot) { 
                  if (snapshot.connectionState == ConnectionState.none ||
                    snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('erro ao carregar coleções'));
                  } else {
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No momento, não há coleções disponíveis.'),);
                    } else {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) => BookCollection(collection: snapshot.data![index],
                      ),
                    );
                  }
                }
                },
            ),
             //retirada
          FutureBuilder<List<CheckoutBook>>(
                future: checkoutRepository.getLeaves(),
                builder: (context, snapshot) { 
                  if (snapshot.connectionState == ConnectionState.none ||
                    snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('erro ao carregar retiradas'));
                  } else {
                    if (!snapshot.hasData || snapshot.data!.isEmpty ) {
                      return const Center(child: Text('No momento, não há retiradas registradas.'),);
                    } else {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) => BookReturn(checkoutBook: snapshot.data![index]),
                    );
                   }
                  }
                }
            ),
       ],
      ),
    ), 
   );
  }
}

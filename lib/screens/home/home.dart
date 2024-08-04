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
               RefreshIndicator(
                onRefresh: () async {
                  await BookRepository.findBook();
                  setState(() {});
                },
                 child: FutureBuilder<List<Book>>(
                  future: BookRepository.findBook(),
                  builder: (context, snapshot) { 
                    if (snapshot.connectionState == ConnectionState.none ||
                       snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('erro ao carregar livros'));
                    } else {
                    if (snapshot.data?.isEmpty ?? true) {
                      return const Center(child: Text('Não ha livros disponiveis no momento'));
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, index) => NewBook(book: snapshot.data![index],
                        ),
                      );
                    }
                    }
                  },
                             ),
               ),
             //coleção
              RefreshIndicator(
                onRefresh: () async {
                  await CollectionRepository.findCollection();
                  setState(() {});
                },
                child: FutureBuilder<List<Collection>>(
                  future: CollectionRepository.findCollection(),
                  builder: (context, snapshot) { 
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('erro ao carregar livros'));
                    } else {
                    if (snapshot.data?.isEmpty ?? true) {
                      return const Center(child: Text('Não ha coleções disponiveis no momento'));
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
              ),
             //retirada
                RefreshIndicator(
                  onRefresh: () async {
                    await CheckoutRepository.findLeaves();
                    setState(() {});
                  },
                  child: FutureBuilder<List<CheckoutBook>>(
                  future: CheckoutRepository.findLeaves(),
                  builder: (context, snapshot) { 
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('erro ao carregar saida'));
                    } else {
                    if (snapshot.data?.isEmpty ?? true) {
                      return const Center(child: Text('Não ha retiradas dispopniveis no momento'));
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, index) => BookReturn(checkoutBook: snapshot.data![index]),
                      );
                    }
                  }
                  },
              ),
          ),
        ],
      ),
    ), 
   );
  }
}
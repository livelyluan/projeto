import 'package:book_finder/screens/shared/barra_superior.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
 const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: custom_appbar(100.0,const Color(0xFF4B7C82)),
        body: TabBarView( 
        children: [
        Container(
          child: const Center(
            child: Text('primeira aba'),
            ),
        ),
        Container(
          child: const Center(
            child: Text('segunda aba'),
            ),
        ),
        Container(
          child: const Center(
            child: Text('terceira aba'),
            ),
        ),
        ], 
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Adicionar um novo livro',
          child: const Icon(Icons.add),
          ),
      ) 
      );
  }
}

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Adicionar um novo livro',
          child: const Icon(Icons.add),
          ),

      ) 
      );
  }
}

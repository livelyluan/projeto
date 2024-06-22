import 'package:book_finder/screens/shared/barra_superior.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custom_appbar(145.0,const Color(0xFF4B7C82)),
       floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Registrar um novo livro',
        child: const Icon(Icons.add),
      ),
    );
  }
}

   
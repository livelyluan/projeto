import 'package:book_finder/screens/shared/new_appbar.dart';
import 'package:flutter/material.dart';

class NewBook extends StatefulWidget {
  const NewBook({super.key});

  @override
  State<NewBook> createState() => _NewBookState();
}

class _NewBookState extends State<NewBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar(const Color(0xFF4B7C82)),
      floatingActionButton: FloatingActionButton(onPressed: () {},
      tooltip: 'salvar',
      child: const Icon(Icons.save),
      ),
      );
  }
}
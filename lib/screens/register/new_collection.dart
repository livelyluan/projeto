import 'package:flutter/material.dart';
import 'package:book_finder/screens/shared/new_appbar.dart';

class NewCollection extends StatefulWidget {
  const NewCollection({super.key});

  @override
  State<NewCollection> createState() => _NewCollectionState();
}
final nameController = TextEditingController();

class _NewCollectionState extends State<NewCollection> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: NewAppBar('Nova Coleção',context),
       floatingActionButton: FloatingActionButton(onPressed: () {},
      tooltip: 'salvar',
      child: const Icon(Icons.save),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
        children: [
         TextField(
          textCapitalization: TextCapitalization.characters,
          autofocus: true,
          controller: nameController,
          decoration: const InputDecoration(
            label: Text('Nome da coleção'),
            border: OutlineInputBorder(),
          ),
         )
        ],
        ),
        ),
    );
  }
}
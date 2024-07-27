
import 'package:flutter/material.dart';
import 'package:book_finder/screens/shared/new_appbar.dart';

class NewCollection extends StatefulWidget {
  const NewCollection({super.key});

  @override
  State<NewCollection> createState() => _NewCollectionState();
}
final nameController = TextEditingController();

final formKey = GlobalKey<FormState>();

class _NewCollectionState extends State<NewCollection> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: NewAppBar('Nova Coleção',context),
       floatingActionButton: FloatingActionButton(
        onPressed: () async{},
      tooltip: 'salvar',
      child: const Icon(Icons.save),
      ),
      key: formKey,
      body:  Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
        children: [
         TextFormField(
          style: const TextStyle(color: Colors.black),
          textCapitalization: TextCapitalization.characters,
          autofocus: true,
          controller: nameController,
          decoration: const InputDecoration(
            hintText: 'Nome da coleção',
            hintStyle: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
            border: OutlineInputBorder(),
            fillColor: Colors.white,
            filled: true
          ),
          validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o nome da coleção';}
                  return null;
                },
         )
        ],
        ),
        ),
    );
  }
}
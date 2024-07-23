import 'package:flutter/material.dart';
import 'package:book_finder/screens/shared/new_appbar.dart';
import 'package:flutter/services.dart';

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
         TextFormField(
          textCapitalization: TextCapitalization.characters,
          inputFormatters: [LengthLimitingTextInputFormatter(20)],
          autofocus: true,
          controller: nameController,
          decoration: const InputDecoration(
            label: Text('Nome da coleção'),
            border: OutlineInputBorder(),
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
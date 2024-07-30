
import 'package:book_finder/model/collection.dart';
import 'package:book_finder/repository/collection_repository.dart';
import 'package:book_finder/screens/home/home.dart';
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
        onPressed: () async{
          if (formKey.currentState!.validate()) {
          saveCollection();
          Navigator.pushAndRemoveUntil( 
            context,
            MaterialPageRoute(builder: (context) =>  Home()),
            (Route<dynamic> route) => false,
            );
       }
        },
      tooltip: 'salvar',
      child: const Icon(Icons.save),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
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
        ),
    );
  }
  void saveCollection() async {
  final  collection = Collection(
    name: nameController.text,
       );
       try {
        final id = await CollectionRepository.insert(collection);
        var snackBar = null;
        if (id > 0) {
          snackBar = SnackBar(content: Text('A coleção $id foi salva com sucesso'));

          nameController.clear();
        } else {
          snackBar = const SnackBar(content: Text('Erro ao salvar a coleção. Por favor, tente novamente mais tarde'));
        }
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
       }
       catch (error) {
        print(error);
       }
  }
}
import 'package:book_finder/model/book.dart';
import 'package:book_finder/repository/Book_repository.dart';
import 'package:book_finder/screens/shared/new_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}
final titleController = TextEditingController();
final authorController = TextEditingController();
final publisherController = TextEditingController();
final volumeController = TextEditingController();
final pubyearController = TextEditingController();

final formKey = GlobalKey<FormState>();

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar('Cadastrar novo livro',const Color(0xFF4B7C82)),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        if (formKey.currentState!.validate()) {
          saveBook();
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
                textCapitalization: TextCapitalization.characters,
                autofocus: true,
                inputFormatters: [LengthLimitingTextInputFormatter(40)],
                controller: titleController,
                decoration: const InputDecoration(
                  label: Text('Título'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
              textCapitalization: TextCapitalization.characters,
              inputFormatters: [LengthLimitingTextInputFormatter(30)],
              controller: authorController,
              decoration: const InputDecoration(
                label: Text('Nome do autor'),
                border: OutlineInputBorder(),
              ),
              ),
              const SizedBox(height: 16),
              TextFormField(
             textCapitalization: TextCapitalization.characters,
             controller: publisherController,
             decoration: const InputDecoration(
              label: Text('Editora'),
              border: OutlineInputBorder(),
             ),
              ),
              const SizedBox(height: 16),
              TextFormField(
             controller: volumeController,
             keyboardType: TextInputType.number,
             inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(2)],
             decoration: const InputDecoration(
              label: Text('Volume'),
              border: OutlineInputBorder(),
             ),
              ),
              const SizedBox(height: 16),
              TextFormField(
              keyboardType: TextInputType.number,
             inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(4)],
             controller: pubyearController,
             decoration: const InputDecoration(
              label: Text('Ano de publicação'),
              border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          ),
        ),
      );
  }
  void saveBook() async {
  final  book = Book(
    title: titleController.text,
     author: authorController.text,
     publisher: publisherController.text,
      volume: volumeController.text,
       publicationYear: pubyearController.text,
       );
       try {
        final id = await BookRepository.insert(book);
        var snackBar = null;
        if (id > 0) {
          snackBar = SnackBar(content: Text('O livro n°$id foi salvo com sucesso'));
        } else {
          snackBar = const SnackBar(content: Text('Erro ao salvar o livro. Por favor, tente novamente mais tarde'));
        }
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
       }
       catch (error) {
        print(error);
       }
  }
}
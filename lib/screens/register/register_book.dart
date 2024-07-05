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
class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar('Cadastrar novo livro',const Color(0xFF4B7C82)),
      floatingActionButton: FloatingActionButton(onPressed: () {},
      tooltip: 'salvar',
      child: const Icon(Icons.save),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          // TODO Criar a chave do form
          child: Column(
            children: [
              TextFormField(
                textCapitalization: TextCapitalization.characters,
                autofocus: true,
                controller: titleController,
                decoration: const InputDecoration(
                  label: Text('Título'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
              textCapitalization: TextCapitalization.characters,
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
}
import 'package:book_finder/model/book.dart';
import 'package:book_finder/repository/book_repository.dart';
import 'package:book_finder/screens/home/home.dart';
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
final pubyearController = TextEditingController(text: _formatDate(DateTime.now()));

final formKey = GlobalKey<FormState>();

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar('Cadastrar novo livro',context),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        if (formKey.currentState!.validate()) {
          saveBook();
          Navigator.pushAndRemoveUntil( 
            context,
            MaterialPageRoute(builder: (context) => const Home()),
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
                textCapitalization: TextCapitalization.characters,
                autofocus: true,
                inputFormatters: [LengthLimitingTextInputFormatter(40)],
                controller: titleController,
                decoration: const InputDecoration(
                  label: Text('Título'),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o titulo do livro';}
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
              textCapitalization: TextCapitalization.characters,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z.,]')),LengthLimitingTextInputFormatter(30)],
              controller: authorController,
              decoration: const InputDecoration(
                label: Text('Nome do autor'),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o nome do autor do livro';}
                  return null;
                },
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
             validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o volume do livro';}
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
              keyboardType: TextInputType.number,
             inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(4)],
             controller: pubyearController,
             decoration:  InputDecoration(
              labelText: 'Ano de publicação',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_month),
            onPressed: () async {
           pubyearController.text = await showDateDialog();
            },
              ),
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

          titleController.clear();
          authorController.clear();
          publisherController.clear();
          volumeController.clear();
          pubyearController.clear();
        } else {
          snackBar = const SnackBar(content: Text('Erro ao salvar o livro. Por favor, tente novamente mais tarde'));
        }
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
       }
       catch (error) {
        print(error);
       }
  }
  Future<String> showDateDialog() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1500),
      lastDate: DateTime(2100),
      initialEntryMode: DatePickerEntryMode.input,
    );
    return _formatDate(date!);
  }
}
String _formatDate(DateTime date) =>
    "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year.toString().padLeft(4,'0')}";
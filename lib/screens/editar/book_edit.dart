import 'package:book_finder/model/book.dart';
import 'package:book_finder/repository/Book_repository.dart';
import 'package:book_finder/screens/shared/new_appbar.dart';
import 'package:flutter/material.dart';

class BookEdit extends StatelessWidget {
final int? bookId;

 BookEdit({super.key, required this.bookId});

TextEditingController titleController = TextEditingController();
TextEditingController authorController = TextEditingController();
TextEditingController volumeController = TextEditingController();

final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: NewAppBar('editar', context),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.save),
        ),
        body: FutureBuilder<Book?>(
          future: BookRepository.findBookId(bookId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none ||
                snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('erro ao carregar Livro'),);
                } else {
                 var book = snapshot.data;
                 return Form(
                  key: formKey,
                  child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    TextFormField(
                    controller: TextEditingController(text: book?.title),
                    decoration: InputDecoration(labelText: 'Título'),
                    validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o título do livro.';
                  }
                  return null;
                },
                    ),
                    SizedBox(height: 4),
                    TextFormField(
                    controller: TextEditingController(text: book?.author),
                    decoration: InputDecoration(labelText: 'author'),
                    validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do author do livro.';
                  }
                  return null;
                },
                    ),
                  SizedBox(height: 4),
                    TextFormField(
                    controller: TextEditingController(text: book?.title),
                    decoration: InputDecoration(labelText: 'volume'),
                    validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o volume do livro.';
                  }
                  return null;
                },
                    ),
                  ],
        
                 )
                 );
                }
          },
          
                 )
     );
  }

  void saveBook() async {
  final book = Book(
    id: bookId, 
    title: titleController.text, 
    author: authorController.text,
    volume: volumeController.text,
  );
  try {
    final id = await BookRepository.adjust(book.id, book); 
    var snackBar = null;
    if (id > 0) {
      snackBar = SnackBar(content: Text('O livro $id foi salvo com sucesso'));
      titleController.clear();
    } else {
      snackBar = const SnackBar(content: Text('Erro ao salvar o livro. Por favor, tente novamente mais tarde'));
    }
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } catch (error) {
    print(error);
  }
}
 
}


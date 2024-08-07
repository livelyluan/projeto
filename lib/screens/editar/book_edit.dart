import 'package:book_finder/model/book.dart';
import 'package:book_finder/repository/Book_repository.dart';
import 'package:book_finder/screens/home/home.dart';
import 'package:book_finder/screens/shared/new_appbar.dart';
import 'package:flutter/material.dart';

class BookEdit extends StatelessWidget {
final int? bookId;

 BookEdit({super.key, required this.bookId});

final titleController = TextEditingController();
final authorController = TextEditingController();
final publisherController = TextEditingController();
final volumeController = TextEditingController();
final pubyearController = TextEditingController();


final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: NewAppBar('editar', context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(formKey.currentState!.validate()) {
          saveChanges(context);
          Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Home()), 
        (Route<dynamic> route) => false,
      );
          }
        },
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

                  titleController.text = snapshot.data!.title;

                  authorController.text = snapshot.data!.author;

                  volumeController.text = snapshot.data!.volume;

                  
                 return Form(
                  key: formKey,
                  child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    TextFormField(
                    controller: titleController,
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
                    controller: authorController,
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
                    controller: publisherController,
                    decoration: InputDecoration(labelText: 'editora'),
                    validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome da editora.';
                  }
                  return null;
                },
                    ),

                    TextFormField(
                    controller: volumeController,
                    decoration: InputDecoration(labelText: 'volume'),
                    validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o volume do livro.';
                  }
                  return null;
                },
                    ),
                    SizedBox(height: 4,),
                    TextFormField(
                    controller: pubyearController,
                    decoration: InputDecoration(labelText: 'Ano de publicação'),
                    validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o ano de publicação do livro.';
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
  void saveChanges(BuildContext context) {
  Book updatedBook = Book(
    id: bookId,
     title: titleController.text,
      author: authorController.text,
      publisher: publisherController.text,
       volume: volumeController.text,
       publicationYear: publisherController.text,
       );

  BookRepository.updateBook( updatedBook).then((_) {

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Livro atualizado com sucesso')));
  }).catchError((error) {

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao atualizar o livro: $error')));
  });
}

}


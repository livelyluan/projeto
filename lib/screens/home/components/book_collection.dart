import 'package:book_finder/model/collection.dart';
import 'package:book_finder/repository/collection_repository.dart';
import 'package:flutter/material.dart';

class BookCollection extends StatelessWidget {
  final Collection collection;
  const BookCollection({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text(collection.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
              PopupMenuItem(child: ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Remover', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
                onTap: () async {
                final result = await CollectionRepository.removeCollection(collection.id!);
                SnackBar snackBar;
                if (result != 0) {
                  snackBar = const SnackBar(content: Text('A coleção foi removida com sucesso!!!'));
                } else {
                  snackBar = const SnackBar(content: Text('Erro ao remover coleção. Por favor, tente novamente mais tarde'));
                } ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
                 ),
                ),
               const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Renomear', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
                    ),
                 ),
               ],
             ),
            Image.asset(
              'assets/images/collection.png',
              width: 90,
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
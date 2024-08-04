import 'package:book_finder/model/book.dart';
import 'package:flutter/material.dart';

class InfoBook extends StatelessWidget {
  final Book book;

  const InfoBook({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
          const  SizedBox(height: 24),
           const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.library_books, size: 64, color: Colors.black),
              ],
            ),
           const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Icon(Icons.book_outlined, size: 36, color: Colors.black),
               const SizedBox(width: 12),
                Text(
                  'Titulo do livro: ${book.title}',
                  style: const TextStyle(fontSize: 24, color: Colors.black),
                ),
              ],
            ),
           const  SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Icon(Icons.account_circle, size: 28, color: Colors.black),
               const SizedBox(width: 12),
                Text(
                  'nome do autor: ${book.author}',
                  style: const TextStyle(fontSize: 28, color: Colors.black),
                ),
              ],
            ),

           const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Icon(Icons.business, size: 34, color: Colors.black),
              const  SizedBox(width: 12),
                Text(
                  'editora: ${book.publisher}',
                  style: const TextStyle(fontSize: 24, color: Colors.black),
                ),
              ],
            ),
          const  SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const  Icon(Icons.collections_bookmark, size: 24, color: Colors.black),
               const SizedBox(width: 12),
                Text(
                  'Volume: ${book.volume}',
                  style: const TextStyle(fontSize: 24, color: Colors.black),
                ),
              ],
            ),
           const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Icon(Icons.date_range, size: 24, color: Colors.black),
               const SizedBox(width: 12),
                Text(
                  'Ano de Lançamento ${book.publicationYear}',
                  style: const TextStyle(fontSize: 24, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
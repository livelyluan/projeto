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
        child: Container(
          width: 800,
          height: 700,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.brown),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.menu_book, size: 64, color: Colors.black),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.book, size: 36, color: Colors.black),
                    SizedBox(width: 12),
                    Text(
                      book.title,
                      style: TextStyle(fontSize: 36, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, size: 28, color: Colors.black),
                    SizedBox(width: 12),
                    Text(
                      book.author,
                      style: TextStyle(fontSize: 28, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.business, size: 24, color: Colors.black),
                    SizedBox(width: 12),
                    Text(
                      '$book.publisher',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bookmark, size: 24, color: Colors.black),
                    SizedBox(width: 12),
                    Text(
                      book.volume,
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today, size: 24, color: Colors.black),
                    SizedBox(width: 12),
                    Text(
                      'Ano de Lançamento ${book.publicationYear}',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
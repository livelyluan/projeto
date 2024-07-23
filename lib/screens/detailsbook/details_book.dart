import 'package:book_finder/screens/shared/new_appbar.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar('detalhes', context),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Book Title',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Author: John Doe'),
            SizedBox(height: 10),
            Text('Published: 2022'),
            SizedBox(height: 20),
            Text(
              'Book Description',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}


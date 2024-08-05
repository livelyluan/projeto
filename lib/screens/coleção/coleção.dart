import 'package:book_finder/screens/shared/new_appbar.dart';
import 'package:flutter/material.dart';

class CollectionScreen extends StatelessWidget {
  final int? collection;
  const CollectionScreen({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: NewAppBar('$collection.name', context),
      body: const Center(child: Text('Em Construção'),)
    );
  }
}
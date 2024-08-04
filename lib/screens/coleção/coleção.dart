import 'package:book_finder/model/collection.dart';
import 'package:book_finder/screens/shared/new_appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final Collection collection;
  const MyWidget({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: NewAppBar('$collection.name', context),
      body: const Center(child: Text('Em Construção'),)
    );
  }
}
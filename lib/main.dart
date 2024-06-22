import 'package:book_finder/screens/home/tela_inicial.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     home: Home(),
     debugShowCheckedModeBanner: false,
    );
  }
}

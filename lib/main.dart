import 'package:book_finder/screens/configurations/configurations.dart';
import 'package:book_finder/screens/home/home.dart';
import 'package:book_finder/screens/register/register_book.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute: 'home',
     routes: {
      'home': (context) => const Home(),
      'register': (context) => const Register(),
      'configurações': (context) => const Configurations(),
     },
     debugShowCheckedModeBanner: false,
    );
  }
}

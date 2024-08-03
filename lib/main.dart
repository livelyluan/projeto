
import 'package:book_finder/screens/configurations/configurations.dart';
import 'package:book_finder/screens/info/componentes/info_book.dart';
import 'package:book_finder/screens/info/details_book.dart';
import 'package:book_finder/screens/home/home.dart';
import 'package:book_finder/screens/info/details_leave.dart';
import 'package:book_finder/screens/register/leave.dart';
import 'package:book_finder/screens/register/new_collection.dart';
import 'package:book_finder/screens/register/register_book.dart';
import 'package:book_finder/screens/start/splash_screen.dart';
import 'package:book_finder/theme.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'BookScreen',
      routes: {

        'BookScreen':(context) => const SplashScreen(),
        'home': (context) =>  Home(),
        'register': (context) => const Register(),
        'configurações': (context) => const Configurations(),
        'saida': (context) => const LeaveBook(),
        'coleção': (context) => const NewCollection(),
        'bookInfo': (context) =>  BookInfo(bookId: ModalRoute.of(context)?.settings.arguments as int?),
        'leaveInfo': (context) => LeaveInfo(checkoutId: ModalRoute.of(context)?.settings.arguments as int?),
      },
      debugShowCheckedModeBanner: false,
     theme: ThemeData(
      colorScheme: MaterialTheme.darkScheme(),
     ),
     darkTheme: ThemeData(
      colorScheme: MaterialTheme.darkScheme(),
     ),
    );
  }
}

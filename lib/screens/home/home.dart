import 'package:book_finder/screens/shared/custom_appbar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custom_appbar('teste', 125.0,const Color(0xFF4B7C82)),
    );
  }
}
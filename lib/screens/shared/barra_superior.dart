import 'package:flutter/material.dart';
import 'package:book_finder/screens/shared/abas.dart';

AppBar custom_appbar(double height,Color background){
  return AppBar(
  toolbarHeight: height,
  backgroundColor: background,
  title:const TextField(
  decoration: InputDecoration(
    hintText: 'pesquisar na biblioteca',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)
      ),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: Color.fromARGB(255, 255, 255, 255),
    contentPadding: 
    EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0)
  ),
  ),
  bottom:  TabBar(
    tabs: [
      CustomTabBarItem(),
      CustomTabBarItem(),
      CustomTabBarItem(),
      ],
    ),
  );
}
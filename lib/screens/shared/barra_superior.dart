import 'package:flutter/material.dart';
import 'package:book_finder/screens/shared/abas.dart';

AppBar Custom_AppBar(double height,Color background){
  return AppBar(
  toolbarHeight: height,
  backgroundColor: background,
  title:Container(
    height: 60.0,
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    decoration:  BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24.0),
    ),
    child:  Row(
      children: [ 
       const SizedBox(width: 2.0,),
       IconButton(onPressed: () {}, icon: const Icon(Icons.settings_applications), iconSize: 35.0,),
      const SizedBox(width: 4.0,),
       const Expanded
        (
          child:  TextField(
        decoration: InputDecoration(
          hintText: 'Pesquisar na Biblioteca',
          hintStyle: TextStyle(fontSize: 20.0),
           alignLabelWithHint: true,
          border: InputBorder.none,
          isDense: true,)
        ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.circle)),
      ],
    ),
  ),
  bottom: const  TabBar(
    tabs: [
      CustomTabBarItem(),
      CustomTabBarItem(),
      CustomTabBarItem(),
      ],
    ),
  );
}
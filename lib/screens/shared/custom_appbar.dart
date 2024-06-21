import 'package:flutter/material.dart';

AppBar custom_appbar(String title, double height,Color background){
  return AppBar(
  title:Text(title),
  toolbarHeight: height,
  backgroundColor: background,
  actions: const [
   SearchBar(),
   ], 
  );
}
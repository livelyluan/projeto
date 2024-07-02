import 'package:flutter/material.dart';

AppBar NewAppBar(String title,Color backgroundColor){
  return AppBar(
    title: Text(title, style: const TextStyle(fontSize: 30, color: Colors.white),),
    backgroundColor: backgroundColor,
  );
}
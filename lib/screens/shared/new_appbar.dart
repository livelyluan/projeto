import 'package:flutter/material.dart';


AppBar NewAppBar(String title,BuildContext context){
  return AppBar(
    title: Text(title, style: const TextStyle(fontSize: 30, color: Colors.white),),
    backgroundColor: const Color(0xFF006971),
  );
}


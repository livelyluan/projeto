import 'package:flutter/material.dart';
import 'package:book_finder/screens/shared/tab_bar.dart';

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
       Container(
        width: 35,
        height: 35,
        decoration: const BoxDecoration(
          color: Color(0xFF006971),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 1.0),
          child: IconButton(
            icon: const Icon(Icons.settings,color: Colors.white,size: 19,),
            tooltip: 'configurações',
            onPressed: () {},
             ),
        ),
       ),
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
        IconButton(onPressed: () {}, icon: const Icon(Icons.search), tooltip: 'pesquisar',),
        Container(
          width: 35,
          height: 35,
          decoration: const BoxDecoration(
          color: Color(0xFF006971),
          shape: BoxShape.circle,
        ),
         child: Padding(
           padding:  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 1.0),
           child: IconButton(
            onPressed: () {},
             icon: const Icon(Icons.person, color: Colors.white,size: 19,),
              tooltip: 'em desenvolvimento',
              ),
         )),
      ],
    ),
  ),
  bottom: const  TabBar(
    tabs: [
      CustomTabBarItem(icon: Icons.home, text: 'Inicio',),
      CustomTabBarItem(icon: Icons.bookmark, text: 'Coleções',),
      CustomTabBarItem(icon: Icons.library_books, text: 'Registro',),
      ],
    ),
  );
}
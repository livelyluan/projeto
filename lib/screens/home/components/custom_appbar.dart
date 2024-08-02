
import 'package:flutter/material.dart';
import 'package:book_finder/screens/shared/tab_bar.dart';

AppBar Custom_AppBar(BuildContext context,double height){
  
  return AppBar(
  toolbarHeight: height,
  backgroundColor: const Color(0xFF006971),
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
            onPressed: () {
              Navigator.pushNamed(context, 'cofigurações');
            },
             ),
        ),
       ),
      const SizedBox(width: 8.0,),
       const Expanded
        (
          child:  TextField(
        decoration: InputDecoration(
          hintText: 'Pesquisar',
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
           alignLabelWithHint: true,
          border: InputBorder.none,
          isDense: true,)
        ),
        ),
        IconButton(onPressed: () {
          
        }, icon: const Icon(Icons.search), tooltip: 'pesquisar', color: Colors.black),
      const  SizedBox(width: 3,),
        Container(
          width: 35,
          height: 35,
          decoration: const BoxDecoration(
          color: Color(0xFF006971),
          shape: BoxShape.circle,
        ),
         child: Padding(
           padding:  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 1.0),
           child: PopupMenuButton(
            icon: const Icon(Icons.add_circle, size: 18, color: Colors.white,),
            tooltip: 'criar',
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Row(
                  children: [
                    Icon(Icons.library_add),
                    SizedBox(width: 8),
                    Text('nova coleção')
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'coleção');
                },
              ),
            PopupMenuItem(
                child: const Row(
                  children: [
                    Icon(Icons.calendar_month_outlined),
                    SizedBox(width: 8),
                    Text('Registrar saida')
                  ],
              ),
              onTap: () {
                Navigator.pushNamed(context, 'saida');
              },
             ),
            ],
           ),
         ),
         ),
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
import 'package:flutter/material.dart';
class CustomTabBarItem extends StatelessWidget {
  final IconData icon;
  final String text;
 const CustomTabBarItem({super.key,required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
  return Container(
     margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
     child: Container(
      decoration: BoxDecoration(
        color: const Color(0xFFCDE7EB),
        borderRadius: BorderRadius.circular(16),
      ),
      child:Container(
        height: 52,
        width: 123,
         padding: const EdgeInsets.fromLTRB(0, 7, 0, 10),
         child:   Column(
          children: [
          Icon(icon, size: 15, color: Colors.black),
         const SizedBox(width: 4,),
          Text(text, style: const TextStyle(fontSize: 14, color: Colors.black),),
          ],
         ),
     ),
     ),
  );
  }
}
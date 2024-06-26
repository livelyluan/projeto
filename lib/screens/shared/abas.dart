import 'package:flutter/material.dart';
class CustomTabBarItem extends StatelessWidget {
 const CustomTabBarItem({super.key});

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
        height: 32,
         padding: const EdgeInsets.fromLTRB(0, 7, 0, 10),
         child:  const SizedBox(
          width: 100,
          height: 100,
          child: Icon(Icons.circle, size: 18, color: Colors.black),
         ),
     ),
     ),
  );
  }
}
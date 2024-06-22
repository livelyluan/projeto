import 'package:flutter/material.dart';

class CustomTabBarItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  return Container(
     margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
     child: Container(
      decoration: BoxDecoration(
        color: const Color(0xFFCDE7EB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 32,
         padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
         child:  SizedBox(
          width: 12,
          height: 12,
          child: Image.network(
            'assets/vectors/icon_2066_x2.svg',
            fit: BoxFit.contain,
         ),
         ),
      ),
     ),
  );
  }
}
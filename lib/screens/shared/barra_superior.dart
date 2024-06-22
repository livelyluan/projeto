import 'package:flutter/material.dart';
import 'package:book_finder/screens/shared/abas.dart';

AppBar custom_appbar(double height,Color background){
  return AppBar(
  toolbarHeight: height,
  backgroundColor: background,
  bottom:  TabBar(
    tabs: [
      CustomTabBarItem(),
      CustomTabBarItem(),
      CustomTabBarItem(),
      ],
    ),
  );
}
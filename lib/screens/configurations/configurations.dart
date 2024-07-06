import 'package:book_finder/screens/shared/new_appbar.dart';
import 'package:flutter/material.dart';

class Configurations extends StatefulWidget {
  const Configurations({super.key});

  @override
  State<Configurations> createState() => _ConfigurationsState();
}

class _ConfigurationsState extends State<Configurations> {
 var switch_notifications = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: NewAppBar('Configurações', const Color(0xFF4B7C82),),
      body:  Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Switch(
                  value: switch_notifications,
                 onChanged: (isActive) {
                  setState(() {
                    switch_notifications = isActive;
                  });
                 }),
             const  Column(
                 children: [
                    Text(
                        'Notificações',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                     ),
                   ),
                 ],
               ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
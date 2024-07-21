import 'package:book_finder/screens/shared/new_appbar.dart';
import 'package:flutter/material.dart';

class Configurations extends StatefulWidget {
  const Configurations({super.key});

  @override
  State<Configurations> createState() => _ConfigurationsState();
}

class _ConfigurationsState extends State<Configurations> {
 var switch_notifications = false;
 var switch_themeDark = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: NewAppBar('Configurações', context),
      body:  Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Switch(
                  value: switch_notifications,
                  activeThumbImage: const AssetImage('assets/images/v.png'),
                  inactiveThumbImage: const AssetImage('assets/images/x.png'),
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
         const SizedBox(height: 8),
            Row(
              children: [
                Switch(
                  activeThumbImage: const AssetImage('assets/images/v.png'),
                  inactiveThumbImage: const AssetImage('assets/images/x.png'),
                  value: switch_themeDark,
                 onChanged: (isActive) {
                  setState(() {
                    switch_themeDark = isActive;
                  });
                 }),
             const  Column(
                 children: [
                    Text(
                        'Tema escuro',
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
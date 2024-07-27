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
                    Text( 'Notificações', style: TextStyle(fontWeight: FontWeight.w800,fontStyle: FontStyle.italic, fontSize: 16),
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
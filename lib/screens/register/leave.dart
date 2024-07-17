import 'package:book_finder/screens/shared/new_appbar.dart';
import 'package:flutter/material.dart';

class LeaveBook extends StatefulWidget {
  const LeaveBook({super.key});

  @override
  State<LeaveBook> createState() => _LeaveBookState();
}
final titleController = TextEditingController();
final userNameController = TextEditingController();
final clientNameController = TextEditingController();
final checkoutController = TextEditingController();
final returnController = TextEditingController();

class _LeaveBookState extends State<LeaveBook> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: NewAppBar('Registrar saida', const Color(0xFF4B7C82)),
      floatingActionButton: FloatingActionButton(onPressed: () {},
      tooltip: 'salvar',
      child: const Icon(Icons.save),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
         child: Form(
          // TODO Criar a chave do form
          child: Column(
            children: [
              TextFormField(
                textCapitalization: TextCapitalization.characters,
                autofocus: true,
                controller: titleController,
                decoration: const InputDecoration(
                  label: Text('Título'),
                  border: OutlineInputBorder(),
                ),
              ),
            const  SizedBox(height:  8),
              TextField(
                textCapitalization: TextCapitalization.characters,
                controller: userNameController,
                decoration: const InputDecoration(
               label: Text('usuario'),
               border: OutlineInputBorder(),
                ),
              ),
            const  SizedBox(height: 8,),
            TextField(
                textCapitalization: TextCapitalization.characters,
                controller: clientNameController,
                decoration: const InputDecoration(
               label: Text('Nome do cliente'),
               border: OutlineInputBorder(),
                ),
              ),
              const  SizedBox(height: 8,),
              TextFormField(
                controller: checkoutController,
                readOnly: true,
                decoration:  InputDecoration(
                border: const OutlineInputBorder(),
                label: const Text('data de saida'),
                suffix: IconButton(
                  icon: const Icon(Icons.calendar_month),
                  onPressed: () {
                  },
                )
                ),
              ),
            const   SizedBox(height: 8,),
            TextFormField(
          controller: returnController,
          readOnly: true,
          decoration: const InputDecoration(
            border:  OutlineInputBorder(),
            label: Text('Data de retorno')
          ),
            )
            ],
          ) ,
         ),
      ),
    );
  }
}
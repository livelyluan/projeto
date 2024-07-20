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
final checkoutController = TextEditingController(text: _formatDate(DateTime.now()));
final returnController = TextEditingController(text: _formatDate(DateTime.now()));

class _LeaveBookState extends State<LeaveBook> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: NewAppBar('Registrar saida',context),
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

                label: const Text('data de saida'),
                border: const OutlineInputBorder(),
                suffix: IconButton(
                  icon: const Icon(Icons.calendar_month),
                  onPressed: () async {
                    checkoutController.text = await showDateDialog();
                  },
                )
                ),
              ),
            const   SizedBox(height: 8,),
            TextFormField(
          controller: returnController,
          readOnly: true,
          decoration:  InputDecoration(
            border: const OutlineInputBorder(),
            label: const Text('Data de retorno'),
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_month),
            onPressed: () async {
           returnController.text = await showDateDialog();
            },
              ),
             ),
            ),
           ],
          ) ,
         ),
      ),
    );
  }
  Future<String> showDateDialog() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialEntryMode: DatePickerEntryMode.input,
    );
    return _formatDate(date!);
  }
}

String _formatDate(DateTime date) =>
    "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year.toString().padLeft(4,'0')}";
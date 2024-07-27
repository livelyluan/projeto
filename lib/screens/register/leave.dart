import 'package:book_finder/model/register_leave.dart';
import 'package:book_finder/repository/leave_repository.dart';
import 'package:book_finder/screens/home/home.dart';
import 'package:book_finder/screens/shared/new_appbar.dart';
import 'package:flutter/material.dart';

class LeaveBook extends StatefulWidget {
  const LeaveBook({super.key});

  @override
  State<LeaveBook> createState() => _LeaveBookState();
}
final titleController = TextEditingController();
final userNameController = TextEditingController();
final studentNameController = TextEditingController();
final checkoutController = TextEditingController(text: _formatDate(DateTime.now()));
final returnController = TextEditingController(text: _formatDate(DateTime.now()));

final formKey = GlobalKey<FormState>();

class _LeaveBookState extends State<LeaveBook> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: NewAppBar('Registrar saida',context),
      floatingActionButton: FloatingActionButton(onPressed: () {
        if (formKey.currentState!.validate()) {
          checkoutRegister();
          Navigator.pushAndRemoveUntil( 
            context,
            MaterialPageRoute(builder: (context) =>  Home()),
            (Route<dynamic> route) => false,
            );
       }
      },
      tooltip: 'salvar',
      child: const Icon(Icons.save),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
         child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(color: Colors.black),
                textCapitalization: TextCapitalization.characters,
                autofocus: true,
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Título',
                  hintStyle: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o titulo do livro';}
                  return null;
                },
              ),
            const  SizedBox(height:  8),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                textCapitalization: TextCapitalization.characters,
                controller: userNameController,
                decoration: const InputDecoration(
               hintText: 'usuario',
               hintStyle: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
               border: OutlineInputBorder(),
               fillColor: Colors.white,
               filled: true
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o nome do usuario';}
                  return null;
                },
              ),
            const  SizedBox(height: 8,),
            TextFormField(
              style: const TextStyle(color: Colors.black),
                textCapitalization: TextCapitalization.characters,
                controller: studentNameController,
                decoration: const InputDecoration(
               hintText: 'Nome do estudante',
               hintStyle: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
               border: OutlineInputBorder(),
               fillColor: Colors.white,
            filled: true
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o nome do estudante';}
                  return null;
                },
              ),
              const  SizedBox(height: 8,),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: checkoutController,
                readOnly: true,
                decoration:  InputDecoration(
                hintText: 'data de retirada',
                hintStyle: const TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
                border: const OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
                suffix: IconButton(
                  icon: const Icon(Icons.calendar_month, color: Colors.black),
                  onPressed: () async {
                    checkoutController.text = await showDateDialog();
                  },
                )
                ),
              ),
            const   SizedBox(height: 8,),
            TextFormField(
          style: const TextStyle(color: Colors.black),
          controller: returnController,
          readOnly: true,
          decoration:  InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Data de devolução',
            hintStyle: const TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
            fillColor: Colors.white,
            filled: true,
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_month, color: Colors.black),
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
  void checkoutRegister() async {
  final  checkoutBook = CheckoutBook(
    title: titleController.text,
     userName: userNameController.text,
     studentName: studentNameController.text,
      checkoutDate: checkoutController.text,
       returnDate: returnController.text,
       );
       try {
        final id = await CheckoutRepository.insert(checkoutBook);
        var snackBar = null;
        if (id > 0) {
          snackBar = SnackBar(content: Text('A retirada foi salva com sucesso $id'));

          titleController.clear();
          userNameController.clear();
          studentNameController.clear();
          checkoutController.clear();
          returnController.clear();
        } else {
          snackBar = const SnackBar(content: Text('Erro ao registrar saida. Por favor, tente novamente mais tarde'));
        }
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
       }
       catch (error) {
        print(error);
       }
  }
}

String _formatDate(DateTime date) =>
    "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year.toString().padLeft(4,'0')}";
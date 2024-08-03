
import 'package:book_finder/model/register_leave.dart';
import 'package:flutter/material.dart';

class InfoCheckout extends StatelessWidget {
  final CheckoutBook checkout;

  const InfoCheckout({super.key, required this.checkout});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text('Titulo do livro: ${checkout.title}'),
        Text('Nome do usuario: ${checkout.userName}'),
        Text('Nome do Estudante: ${checkout.studentName}'),
        Text('Data de Retirada: ${checkout.checkoutDate}'),
        Text('Data de Devolução: ${checkout.returnDate}'),
      ],
    );
  }
}
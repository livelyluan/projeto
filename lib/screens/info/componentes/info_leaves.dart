import 'package:book_finder/model/register_leave.dart';
import 'package:flutter/material.dart';

class InfoCheckout extends StatelessWidget {
  final CheckoutBook checkout;

  const InfoCheckout({super.key, required this.checkout});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
          const  SizedBox(height: 24),
           const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.library_books, size: 64, color: Colors.black),
              ],
            ),
           const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Icon(Icons.book_outlined, size: 36, color: Colors.black),
               const SizedBox(width: 12),
                Text(
                  'Titulo do Livro: ${checkout.title}',
                  style: const TextStyle(fontSize: 24, color: Colors.black),
                ),
              ],
            ),
           const  SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Icon(Icons.account_circle, size: 28, color: Colors.black),
               const SizedBox(width: 12),
                Text(
                  'nome do Usuario: ${checkout.userName}',
                  style: const TextStyle(fontSize: 28, color: Colors.black),
                ),
              ],
            ),

           const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Icon(Icons.school, size: 34, color: Colors.black),
              const  SizedBox(width: 12),
                Text(
                  'Nome do Estudante: ${checkout.studentName}',
                  style: const TextStyle(fontSize: 24, color: Colors.black),
                ),
              ],
            ),
          const  SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const  Icon(Icons.access_time, size: 24, color: Colors.black),
               const SizedBox(width: 12),
                Text(
                  'Data de Retirada: ${checkout.checkoutDate}',
                  style: const TextStyle(fontSize: 24, color: Colors.black),
                ),
              ],
            ),
           const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Icon(Icons.date_range, size: 24, color: Colors.black),
               const SizedBox(width: 12),
                Text(
                  'Data de retorno ${checkout.returnDate}',
                  style: const TextStyle(fontSize: 24, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
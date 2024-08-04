import 'package:book_finder/model/register_leave.dart';
import 'package:book_finder/repository/leave_repository.dart';
import 'package:book_finder/screens/info/componentes/info_leaves.dart';
import 'package:book_finder/screens/shared/new_appbar.dart';
import 'package:flutter/material.dart';


class LeaveInfo extends StatelessWidget {

  final int? checkoutId;

 LeaveInfo({super.key, required this.checkoutId});
 
final checkoutRepository = CheckoutRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar('informações', context),

      body: FutureBuilder<CheckoutBook?>(
        future: CheckoutRepository.findCheckoutId(checkoutId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Erro ao carregar a retirada');
          } else {
            var checkout = snapshot.data;
            return Card(
              color: Colors.grey[600],
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => InfoCheckout(checkout: checkout!),
              ),
            );
          }
        },
      ),
    );
  }
}

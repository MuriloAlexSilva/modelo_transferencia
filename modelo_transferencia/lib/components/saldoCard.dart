import 'package:flutter/material.dart';
import 'package:modelo_transferencia/models/saldoModel.dart';

class SaldoCard extends StatelessWidget {
  final Saldo saldo;

  const SaldoCard({Key key, this.saldo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          saldo.toString(),
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

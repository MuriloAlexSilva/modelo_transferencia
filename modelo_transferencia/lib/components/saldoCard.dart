import 'package:flutter/material.dart';
import 'package:modelo_transferencia/models/saldoModel.dart';
import 'package:provider/provider.dart';

class SaldoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<Saldo>(
            builder: (context, valor, child) {
              return Text(
                valor.toString(),
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              );
            },
          )),
    );
  }
}

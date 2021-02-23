import 'package:flutter/material.dart';
import 'package:modelo_transferencia/components/saldoCard.dart';
import 'package:modelo_transferencia/models/saldoModel.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bytebank"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: SaldoCard(
            saldo: Saldo(valor: 10.0),
          ),
        ),
      ),
    );
  }
}

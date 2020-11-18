import 'package:flutter/material.dart';

class PageTransferencia extends StatelessWidget {
  //Controllers para capturar os dados dos TextField
  final TextEditingController _controllerNumeroConta = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Criando Transferência",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controllerNumeroConta,
                style: TextStyle(fontSize: 24),
                decoration: InputDecoration(
                    labelText: "Numero da Conta", hintText: "0000"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controllerValor,
                style: TextStyle(fontSize: 24),
                decoration:
                    InputDecoration(labelText: "Valor", hintText: "000"),
              ),
            ),
            RaisedButton(
              child: Text("Confirmar"),
              onPressed: () {
                debugPrint("Clicou");
                final int numeroConta = int.tryParse(
                    _controllerNumeroConta.text); //Para converter em int
                final double valor = double.tryParse(
                    _controllerValor.text); //Para converter em double
                if (numeroConta != null && valor != null) {
                  final transferenciaCriada = Transferencia(valor, numeroConta);
                  print("$transferenciaCriada");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() =>
      'Transferencia(valor: $valor, numeroConta: $numeroConta)';
}

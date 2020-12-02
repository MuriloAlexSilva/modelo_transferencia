import 'package:flutter/material.dart';
import 'package:modelo_transferencia/components/editor.dart';
import 'package:modelo_transferencia/models/transferencia.dart';

class PageTransferencia extends StatefulWidget {
  //Controllers para capturar os dados dos TextField
  @override
  _PageTransferenciaState createState() => _PageTransferenciaState();
}

class _PageTransferenciaState extends State<PageTransferencia> {
  final TextEditingController _controllerNumeroConta = TextEditingController();

  final TextEditingController _controllerValor = TextEditingController();

  void _criaTransferencia(BuildContext context) {
    //Para enviar o context
    final int numeroConta =
        int.tryParse(_controllerNumeroConta.text); //Para converter em int
    final double valor =
        double.tryParse(_controllerValor.text); //Para converter em double
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      print("$transferenciaCriada");
      Navigator.pop(context, transferenciaCriada);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                  controlador: _controllerNumeroConta,
                  rotulo: "Numero da Conta",
                  dica: "0000"),
              Editor(
                controlador: _controllerValor,
                rotulo: "Valor",
                dica: "00.00",
                icone: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text("Confirmar"),
                onPressed: () =>
                    _criaTransferencia(context), //Para enviar o context
              )
            ],
          ),
        ),
      ),
    );
  }
}

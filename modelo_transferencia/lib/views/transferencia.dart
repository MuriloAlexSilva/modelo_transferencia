import 'package:flutter/material.dart';
import 'package:modelo_transferencia/components/editor.dart';
import 'package:modelo_transferencia/models/saldoModel.dart';
import 'package:modelo_transferencia/models/transferencia.dart';
import 'package:modelo_transferencia/models/transferencias.dart';
import 'package:provider/provider.dart';

class PageTransferencia extends StatelessWidget {
  final TextEditingController _controllerNumeroConta = TextEditingController();

  final TextEditingController _controllerValor = TextEditingController();

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

  void _criaTransferencia(BuildContext context) {
    //Para enviar o context
    final int numeroConta =
        int.tryParse(_controllerNumeroConta.text); //Para converter em int
    final double valor =
        double.tryParse(_controllerValor.text); //Para converter em double
    if (numeroConta != null && valor != null) {
      final novaTransferencia = Transferencia(valor, numeroConta);
      _validaEstado(context, novaTransferencia, valor);
      Navigator.pop(context);
    }
  }

  _validaEstado(context, novaTransferencia, valor) {
    Provider.of<Transferencias>(context, listen: false)
        .adiciona(novaTransferencia);
    Provider.of<Saldo>(context, listen: false).subtrair(valor);
  }
}

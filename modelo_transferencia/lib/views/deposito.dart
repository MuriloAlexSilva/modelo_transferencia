import 'package:flutter/material.dart';
import 'package:modelo_transferencia/components/editor.dart';
import 'package:modelo_transferencia/models/saldoModel.dart';
import 'package:provider/provider.dart';

class Deposito extends StatelessWidget {
  final TextEditingController _controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Receber Depósito",
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
                controlador: _controllerValor,
                rotulo: "Valor",
                dica: "00.00",
                icone: Icons.monetization_on,
              ),
              RaisedButton(
                  child: Text("Confirmar"),
                  onPressed: () {
                    _deposito(context);
                  })
            ],
          ),
        ),
      ),
    );
  }

  _deposito(context) {
    //para converter o valor de texto para double
    final double valor = double.tryParse(_controllerValor.text);
    // // final depositoValido = _validaDeposito(valor);
    if (valor != null) {
      _atualizaEstado(context, valor);
      Navigator.pop(context);
    }
  }
}

// // _validaDeposito(valor) {
// //   final _campoPreenchido = valor != null;
// //   return _campoPreenchido;
// // }

_atualizaEstado(context, valor) {
  Provider.of<Saldo>(context, listen: false).adiciona(valor);
}

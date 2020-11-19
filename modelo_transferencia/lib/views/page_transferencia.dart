import 'package:flutter/material.dart';

class PageTransferencia extends StatelessWidget {
  //Controllers para capturar os dados dos TextField
  final TextEditingController _controllerNumeroConta = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();

  //Seria para criar uma função
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

class Editor extends StatelessWidget {
  final TextEditingController controlador; //var do controlador
  final String rotulo;
  final String dica;
  final IconData icone; //var do icone

  //Quando coloca o construtor com {} vc deixa o mesmo, opcional, igual os Widgets do flutter
  const Editor({Key key, this.controlador, this.rotulo, this.dica, this.icone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
            labelText: rotulo,
            hintText: dica,
            icon: icone != null ? Icon(icone) : null
            //Seria se o icone diferente de nulo, mostrar o icone, senão ficar nulo
            ),
      ),
    );
  }
}

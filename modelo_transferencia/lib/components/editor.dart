import 'package:flutter/material.dart';

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
        keyboardType: TextInputType.number,
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

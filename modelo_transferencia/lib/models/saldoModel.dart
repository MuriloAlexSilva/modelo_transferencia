import 'package:flutter/material.dart';

class Saldo extends ChangeNotifier {
  double valor;

  Saldo({this.valor});

  //Função para adionar o valor desejado
  void adiciona(double valor) {
    this.valor += valor;
    notifyListeners();
  }

  //Função para subtrair o valor desejado
  void subtrair(double valor) {
    this.valor -= valor;
    notifyListeners();
  }

  @override
  String toString() => 'R\$ $valor';
}

import 'package:flutter/material.dart';
import 'package:modelo_transferencia/views/page_listaTransferencia.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: ListaTransferencia(),
    );
  }
}

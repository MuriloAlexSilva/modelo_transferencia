import 'package:flutter/material.dart';
import 'package:modelo_transferencia/views/lista_transferencia.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal[900],
        backgroundColor: Colors.teal[100],
        accentColor: Colors.teal[900],
        buttonColor: Colors.teal[300],
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          buttonColor: Colors.teal[300],
        ),
      ),
      home: ListaTransferencia(),
    );
  }
}

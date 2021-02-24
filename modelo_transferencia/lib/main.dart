import 'package:flutter/material.dart';
import 'package:modelo_transferencia/models/transferencias.dart';
import 'package:modelo_transferencia/views/dashboard.dart';
import 'package:modelo_transferencia/views/deposito.dart';
import 'package:modelo_transferencia/views/transferencia.dart';
import 'package:provider/provider.dart';

import 'models/saldoModel.dart';

void main() {
  runApp(MultiProvider(
    //Aqui será colocado a var que será utilizada em toda a app
    providers: [
      ChangeNotifierProvider(
        create: (context) => Saldo(valor: 0),
      ),
      ChangeNotifierProvider(
        create: (context) => Transferencias(),
      ),
    ],
    child: MyApp(),
  ));
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
      initialRoute: '/',
      routes: {
        '/': (context) => Dashboard(),
        '/transferencia': (context) => PageTransferencia(),
        '/deposito': (context) => Deposito(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:modelo_transferencia/components/saldoCard.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bytebank"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              //Chama somente o saldoCard, pq o valor é inserido no ChangeNotifierProvider no main
              child: SaldoCard(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        child: Text(
                          "Nova Transferência",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/transferencia");
                        },
                      ),
                      RaisedButton(
                        child: Text(
                          "Receber Depósito",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/deposito");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

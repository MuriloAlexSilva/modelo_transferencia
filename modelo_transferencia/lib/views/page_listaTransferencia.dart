import 'package:flutter/material.dart';
import 'package:modelo_transferencia/views/page_transferencia.dart';

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Transferência"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //Quando vc utiliza este tipo de navigator, ele já cria o return da
          //pagina que deu o push.

          //Já o Future é incluso  no Navigator.push, porém ele seria para aguardar uma resposta
          //da outra pagina.
          final Future<Transferencia> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PageTransferencia();
              },
            ),
          );
          //future que irá receber o context
          future.then(
              (transferenciaRecebida) => debugPrint("$transferenciaRecebida"));
        },
      ),
    );
  }
}

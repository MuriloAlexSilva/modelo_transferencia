import 'package:flutter/material.dart';
import 'package:modelo_transferencia/views/page_transferencia.dart';

class ListaTransferencia extends StatelessWidget {
  final List<Transferencia> _transferencias = List();

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
        child: ListView.builder(
          itemCount: _transferencias.length,
          itemBuilder: (context, index) {
            final transferencia = _transferencias[index];
            return ItemTransferencia(
              transferencia: transferencia,
            );
          },
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
            (transferenciaRecebida) {
              debugPrint("$transferenciaRecebida");
              _transferencias.add(transferenciaRecebida);
            },
          );
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  const ItemTransferencia({Key key, this.transferencia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(transferencia.valor.toString()),
        subtitle: Text(transferencia.numeroConta.toString()),
      ),
    );
  }
}

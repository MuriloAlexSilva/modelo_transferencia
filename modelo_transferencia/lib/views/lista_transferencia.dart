import 'package:flutter/material.dart';
import 'package:modelo_transferencia/models/transferencia.dart';
import 'package:modelo_transferencia/views/formulario.dart';

class ListaTransferencia extends StatefulWidget {
  @override
  _ListaTransferenciaState createState() => _ListaTransferenciaState();
}

class _ListaTransferenciaState extends State<ListaTransferencia> {
  final List<Transferencia> _transferencias = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
              Future.delayed(Duration(seconds: 2), () {
                debugPrint("$transferenciaRecebida");
                // O if abaixo seria para contornar o erro ao retornar a tela sem valor
                if (transferenciaRecebida != null) {
                  setState(() {
                    _transferencias.add(transferenciaRecebida);
                  });
                }
              });
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
      color: Theme.of(context).buttonColor,
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text("Conta: ${transferencia.numeroConta.toString()}"),
        subtitle: Text("Saldo: \$ ${transferencia.valor.toString()}0"),
      ),
    );
  }
}

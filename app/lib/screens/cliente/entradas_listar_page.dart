import 'package:flutter/material.dart';
import 'package:tickets/providers/entradas_provider.dart';
import 'package:tickets/screens/cliente/entrada_detalle_page.dart';

class EntradasListarPage extends StatefulWidget {
  const EntradasListarPage({Key? key}) : super(key: key);

  @override
  State<EntradasListarPage> createState() => _EntradasListarPageState();
}

class _EntradasListarPageState extends State<EntradasListarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entradas Compradas'),
      ),
      body: FutureBuilder(
        future: EntradasProvider().getEntradasCompradas('ID USUARIO'),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              var entrada = snapshot.data[index];
              return Dismissible(
                key: ObjectKey(entrada),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.cyan,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Text(
                        'Detalle Ticket',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                onDismissed: (direction) {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (context) => EntradaDetallePage(
                          entrada['idEvento'], entrada['numero_entrada']));
                  Navigator.push(context, route);
                },
                child: ListTile(
                  leading: Icon(Icons.event),
                  title: Text(entrada['numero_entrada']),
                  subtitle: Text(entrada['idEvento']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

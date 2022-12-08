import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tickets/providers/eventos_provider.dart';
import 'package:tickets/screens/cliente/entradas_agregar_page.dart';

import '../admin/loginv1.dart';

class EventosListarPage extends StatefulWidget {
  String iduser;
  EventosListarPage(this.iduser, {Key? key}) : super(key: key);

  @override
  State<EventosListarPage> createState() => _EventosListarPageState();
}

class _EventosListarPageState extends State<EventosListarPage> {
  @override
  Widget build(BuildContext context) {
    final Future<User?> user = Loginv1.iniciarSesion(context: context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos'),
      ),
      body: FutureBuilder(
        future: EventosProvider().getEventos(),
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
              var evento = snapshot.data[index];
              int cont = 0;
              while (cont < evento['entradas_r'].length) {
                if (evento['entradas_r'][cont]['cliente_id'] == widget.iduser) {
                  return Container();
                }
                cont = cont + 1;
              }
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.blue,
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
                        'Comprar Ticket',
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
                      builder: (context) => EntradasAgregarPage(
                          evento['idEvento'], evento['entradas_vendidas'] + 1));
                  Navigator.push(context, route)
                      .then((value) => setState(() {}));
                },
                child: ListTile(
                  leading: Icon(Icons.event),
                  title: Text(evento['nombre']),
                  subtitle: Text(evento['fechaEvento']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

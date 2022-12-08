import 'package:flutter/material.dart';
import 'package:tickets/providers/eventos_provider.dart';
import 'package:tickets/screens/cliente/entradas_agregar_page.dart';

class EventosListarPage extends StatefulWidget {
  const EventosListarPage({Key? key}) : super(key: key);

  @override
  State<EventosListarPage> createState() => _EventosListarPageState();
}

class _EventosListarPageState extends State<EventosListarPage> {
  @override
  Widget build(BuildContext context) {
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
              return Dismissible(
                key: ObjectKey(evento),
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

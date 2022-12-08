import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tickets/providers/eventos_provider.dart';
import 'package:tickets/screens/admin/agregar_evento.dart';

class EventosAdmin extends StatefulWidget {
  @override
  State<EventosAdmin> createState() => _EventosAdminState();
}

class _EventosAdminState extends State<EventosAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: EventosProvider().getEventos(),
        builder: (context, AsyncSnapshot snap) {
          if (!snap.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 1.5,
            ),
            itemCount: snap.data.length,
            itemBuilder: (context, index) {
              var evento = snap.data[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slidable(
                  startActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: Colors.purple,
                        icon: Icons.edit,
                        label: 'Editar',
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          EventosProvider()
                              .borrarEvento(evento['idEvento'])
                              .then((borrado) {
                            if (borrado) {
                              snap.data.removeAt(index);
                              setState(() {});
                            }
                          });
                        },
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                        label: 'Borrar',
                      )
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) async {
                          var respuesta = await EventosProvider().editarEstado(
                              evento['idEvento'],
                              evento['nombre'],
                              evento['descripcion'],
                              evento['fechaEvento'],
                              evento['entradas'],
                              evento['precio']);
                          if (respuesta['message'] != null) {
                            print(respuesta['message']);
                          }
                          setState(() {});
                        },
                        backgroundColor: Colors.orange,
                        icon: Icons.timer_off,
                        label: 'Expirado',
                      )
                    ],
                  ),
                  child: ListTile(
                    leading: Icon(Icons.event),
                    title: Text('${evento['nombre']}'),
                    subtitle: Text('${evento['descripcion']}'),
                    trailing: Column(
                      children: [
                        Text('Entradas: ${evento['entradas']}'),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Estado: ${evento['estado']}')
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          MaterialPageRoute route =
              MaterialPageRoute(builder: (context) => AgregarEventoPage());
          Navigator.push(context, route).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}

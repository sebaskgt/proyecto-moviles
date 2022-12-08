import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tickets/providers/eventos_provider.dart';
import 'package:tickets/screens/admin/agregar_evento.dart';
import 'package:tickets/screens/admin/editar_evento.dart';
import 'package:tickets/screens/admin/editar_page.dart';

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
              Color color =
                  evento['estado'] == 'VIGENTE' ? Colors.green : Colors.red;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slidable(
                  startActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          MaterialPageRoute route = MaterialPageRoute(
                            builder: (context) =>
                                EditarEventoPage(evento['idEvento']),
                          );
                          Navigator.push(context, route).then((valor) {
                            setState(() {});
                          });
                        },
                        backgroundColor: Colors.purple,
                        icon: Icons.edit,
                        label: 'Editar',
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          confirmDialog(context, evento['nombre'])
                              .then((confirma) {
                            if (confirma) {
                              EventosProvider()
                                  .borrarEvento(evento['idEvento'])
                                  .then((borrado) {
                                if (borrado) {
                                  snap.data.removeAt(index);
                                  setState(() {});
                                }
                              });
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
                    leading: Icon(
                      Icons.event,
                      color: color,
                    ),
                    title: Text('${evento['nombre']}'),
                    subtitle: Text('${evento['descripcion']}'),
                    trailing: Column(
                      children: [
                        Text('Entradas: ${evento['entradas']}'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Estado: ${evento['estado']}',
                          style: TextStyle(
                              color: color,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
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

  void mostrarSnackbar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      content: Text(mensaje),
    ));
  }

  Future<dynamic> confirmDialog(BuildContext context, String evento) {
    return showDialog(
        barrierDismissible:
            false, //para evitar cerrar el dialogo presionando fuera de el
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirmacion de Borrado'),
            content: Text('Confirma borrar el evento $evento?'),
            actions: [
              TextButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.pop(context, false),
              ),
              ElevatedButton(
                child: Text('Confirmar'),
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () => Navigator.pop(context, true),
              )
            ],
          );
        });
  }
}

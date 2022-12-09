import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tickets/providers/eventos_provider.dart';

class EntradaDetallePage extends StatefulWidget {
  String userName;
  String idEvento;
  int numero_entrada;
  EntradaDetallePage(this.userName, this.idEvento, this.numero_entrada,
      {Key? key})
      : super(key: key);

  @override
  State<EntradaDetallePage> createState() => _EntradaDetallePageState();
}

class _EntradaDetallePageState extends State<EntradaDetallePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalle entrada'),
        ),
        body: FutureBuilder(
          future: EventosProvider().getEvento(widget.idEvento),
          builder: (context, AsyncSnapshot snap) {
            if (!snap.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var evento = snap.data;
            return Center(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      'Numero de entrada: ${widget.numero_entrada}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      '${evento['nombre']}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      '${evento['descripcion']}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text('Estado del Evento: ${evento['estado']}'),
                    SizedBox(
                      height: 300,
                    ),
                    Text('Fecha del evento: ${evento['fechaEvento']}'),
                    QrImage(
                      data:
                          'http://www.usmentradas.cl/${widget.numero_entrada}',
                      size: 200,
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}

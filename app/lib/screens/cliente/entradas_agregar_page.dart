import 'package:flutter/material.dart';
import 'package:tickets/providers/entradas_provider.dart';
import 'package:tickets/providers/eventos_provider.dart';

class EntradasAgregarPage extends StatefulWidget {
  String idEvento;
  int numero_entrada;
  EntradasAgregarPage(this.idEvento, this.numero_entrada, {Key? key})
      : super(key: key);

  @override
  State<EntradasAgregarPage> createState() => _EntradasAgregarPageState();
}

class _EntradasAgregarPageState extends State<EntradasAgregarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: EventosProvider().getEvento(widget.idEvento),
          builder: ((context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            return Text("Comprar entrada para " + snapshot.data['nombre']);
          }),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: EventosProvider().getEvento(widget.idEvento),
              builder: ((context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                var evento = snapshot.data;
                return ListView(
                  children: [
                    Container(
                        child:
                            Text('Fecha del evento: ' + evento['fechaEvento'])),
                    Container(
                        child: Text('Descripción: ' + evento['descripcion'])),
                    Container(
                        child: Text(
                            'Cantidad de entradas: ' + evento['entradas'])),
                    Container(
                      child: Text('Valor de entrada: ' + evento['precio']),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.edit),
                            Text('Comprar entrada'),
                          ],
                        ),
                        onPressed: () async {
                          //enviar por post al api
                          await EntradasProvider().agregarEntrada(
                            widget.idEvento,
                            widget.numero_entrada,
                            // Falta obtener el id del usuario
                            "ID USUARIO",
                          );

                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

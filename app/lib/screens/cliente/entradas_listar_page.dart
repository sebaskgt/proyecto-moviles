import 'package:flutter/material.dart';
import 'package:tickets/providers/entradas_provider.dart';
import 'package:tickets/screens/cliente/entrada_detalle_page.dart';

class EntradasListarPage extends StatefulWidget {
  String iduser;
  String name;
  EntradasListarPage(this.name, this.iduser, {Key? key}) : super(key: key);

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
        future: EntradasProvider().getEntradasCompradas(widget.iduser),
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
              return ListTile(
                leading: Icon(Icons.event),
                title: Text(entrada['numero_entrada'].toString()),
                subtitle: Text(entrada['idEvento']),
                trailing: Text('Estado: ${entrada['evento']['estado']}'),
                onTap: (() {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (context) => EntradaDetallePage(widget.name,
                          entrada['idEvento'], entrada['numero_entrada']));
                  Navigator.push(context, route);
                }),
              );
            },
          );
        },
      ),
    );
  }
}

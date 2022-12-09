import 'package:flutter/material.dart';
import 'package:tickets/models/noticias.dart';
import 'package:tickets/screens/cliente/entradas_agregar_page.dart';
import 'package:tickets/screens/cliente/entradas_listar_page.dart';
import 'package:tickets/screens/cliente/eventos_listar_page.dart';
import 'package:tickets/screens/cliente/noticias.dart';
class TabCliente extends StatefulWidget {
  String userName;
  String idEvento;
  TabCliente(this.userName, this.idEvento,{Key? key}): super(key: key);

  @override
  State<TabCliente> createState() => _TabClienteState();
}

class _TabClienteState extends State<TabCliente> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Certamen DAM 3'),
          bottom: TabBar(isScrollable: true, tabs: [
            Tab(
              text: 'Noticias',
            ),
            Tab(
              text: 'Eventos',
            ),
            Tab(text: 'Usuario'),
          ]),
        ),
        body:
            TabBarView(children: [Noticias(), EntradasListarPage(widget.userName,widget.idEvento), EventosListarPage(widget.userName),]),
      ),
    );
  }
}

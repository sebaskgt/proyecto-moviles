import 'package:flutter/material.dart';
import 'package:tickets/screens/admin/homepage.dart';
import 'package:tickets/screens/admin/eventos_admin.dart';
import 'package:tickets/screens/admin/vista_usuario.dart';

class ControllerTab extends StatelessWidget {
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
            TabBarView(children: [HomePage(), EventosAdmin(), VistaUsuario()]),
      ),
    );
  }
}

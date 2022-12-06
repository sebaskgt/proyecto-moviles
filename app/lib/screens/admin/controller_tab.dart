import 'package:flutter/material.dart';
import 'package:tickets/screens/admin/homepage.dart';
import 'package:tickets/screens/admin/seba_god.dart';

class ControllerTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(appBar: AppBar(
        title: Text('Certamen DAM 3'),
        bottom: TabBar(
          isScrollable: true,
          tabs: [
            Tab(
              text: 'Noticias',
            ),
            Tab(text: 'ScreenSeba',)
        ]),
      ),
      body: TabBarView(children: [
        HomePage(),
        SebaGod(),
      ]),),
    );
  }
}
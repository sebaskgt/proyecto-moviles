import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tickets/models/noticias.dart';
import 'package:tickets/widgets/noticiascard.dart';
import 'package:tickets/provider/noticiaprodiver.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noticiasProvider = Provider.of<NoticiaProvider>(context);

    if (noticiasProvider.isLoading)
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.indigo,
          ),
        ),
      );

    return Scaffold(
      body: ListView.builder(
          itemCount: noticiasProvider.noticias.length,
          itemBuilder: (BuildContext context, int index) => NoticiasCard(
                noticia: noticiasProvider.noticias[index],
              )),

      //**BOTON** ESTO NO DEBE IR EN CLIENTE HOMEPAGE
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          noticiasProvider.selectedNoticia = Noticia(
            titulo: '',
            desarrollo: '',
          );
          Navigator.of(context).pushNamed('/editarPage');
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tickets/models/noticias.dart';
import 'package:tickets/widgets/noticiascard.dart';
import 'package:tickets/provider/noticiaprodiver.dart';

class Noticias extends StatelessWidget {
  const Noticias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noticiasProvider =  Provider.of<NoticiaProvider>(context);

    if(noticiasProvider.isLoading) return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.indigo,
        ),
      ),
    );

    return Scaffold(
    body: ListView.builder(
      itemCount: noticiasProvider.noticias.length,
      itemBuilder: (BuildContext context, int index)=> NoticiasCard(
        noticia: noticiasProvider.noticias[index],
      )
    ),

    );
  }
}
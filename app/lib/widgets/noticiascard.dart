import 'package:flutter/material.dart';
import 'package:tickets/models/noticias.dart';

class NoticiasCard extends StatelessWidget {

  final Noticia noticia;
  const NoticiasCard({Key? key, required this.noticia}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 30,bottom: 10),
        width: double.infinity,
        height: 400,
        decoration: _fueraCard(), //ACA SE MODELA LA PARTE DE AFUERA DEL CARD
        child: Stack(children: [
          Column(
            children: [
              SizedBox(height: 2,),
              Row(children: [_titulo(Text(noticia.titulo), titulo: noticia.titulo,)],),
              SizedBox(height: 5,),
              _desarrollo(Text(noticia.desarrollo), desarrollo: noticia.desarrollo,),
              _fecha(),
            ],
          )

        ]),
      ),
    );
  }

  BoxDecoration _fueraCard() {
    return BoxDecoration(
        color: Color(0xFFe1daca),
        borderRadius: BorderRadius.circular(25),
        boxShadow:[
          BoxShadow(
            color: Color(0xFF5d544d),
            offset: Offset(0, 7),
            blurRadius: 10
          )
        ]
      );
  }
}

class _titulo extends StatelessWidget {
  final String titulo;
  const _titulo(Text text, {required this.titulo});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          child: Center(child: Text(titulo,style: TextStyle(color: Colors.grey[150],fontSize: 15,fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }
}


class _desarrollo extends StatelessWidget {
  final String desarrollo;
  const _desarrollo(Text text, {required this.desarrollo});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(desarrollo,style: TextStyle(color: Colors.grey[125],fontSize: 15),)),
    );
  }
}

class _fecha extends StatelessWidget {
  const _fecha({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          child: Center(child: Text('',style: TextStyle(color: Colors.grey[125],fontSize: 15),)),
        ),
      ),
    );
  }
}



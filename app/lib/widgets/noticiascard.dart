import 'package:flutter/material.dart';

class NoticiasCard extends StatelessWidget {
  const NoticiasCard({Key? key}) : super(key: key);

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
              Row(children: [_titulo()],),
              SizedBox(height: 5,),
              _desarrollo(),
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
  const _titulo({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          child: Center(child: Text('NOTICIA',style: TextStyle(color: Colors.grey[150],fontSize: 15,fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }
}


class _desarrollo extends StatelessWidget {
  const _desarrollo({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('La calle es una selva de cemento Y de fieras salvajes, cómo noYa no hay quien salga loco de contento Donde quiera te espera lo peor Donde quiera te espera lo peorJuanito Alimaña con mucha maña llega al mostrador',style: TextStyle(color: Colors.grey[125],fontSize: 15),)),
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
          child: Center(child: Text('Fecha de noticia: 00/00/0000',style: TextStyle(color: Colors.grey[125],fontSize: 15),)),
        ),
      ),
    );
  }
}



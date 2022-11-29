import 'package:flutter/material.dart';
import 'package:app/widgets/noticiascard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
    body: ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index)=> NoticiasCard()
    ),

    //**BOTON** ESTO NO DEBE IR EN CLIENTE HOMEPAGE
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){},
    ),
    );
  }
}
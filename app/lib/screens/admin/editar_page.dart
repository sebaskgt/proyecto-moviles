import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:tickets/provider/noticia_formulario_provider.dart';
import 'package:tickets/widgets/inputDecorations.dart';
import 'package:tickets/models/noticias.dart';
import 'package:tickets/widgets/noticiascard.dart';
import 'package:tickets/provider/noticiaprodiver.dart';

class Editar_Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final noticiasProvider = Provider.of<NoticiaProvider>(context);

    return ChangeNotifierProvider(
    create:( _ ) => NoticiasFormularioProvider(noticiasProvider.selectedNoticia),
    child: _editarPageBody(noticiasProvider: noticiasProvider));
  }
}

class _editarPageBody extends StatelessWidget {
  const _editarPageBody({Key? key, required  this.noticiasProvider}) : super(key: key);

  final NoticiaProvider noticiasProvider;
  @override
  Widget build(BuildContext context) {
    final noticiForm = Provider.of<NoticiasFormularioProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
                SizedBox(height: 20,),
                Row(
                  children: [
                    IconButton(onPressed: ()=> Navigator.of(context).pop(),
                     icon: Icon(Icons.arrow_back_ios_new_outlined,size: 40,color: Colors.white,)),
                  ],
                ),
           _formulario(),
            SizedBox(height: 100,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_alt_outlined),
        onPressed: () async {
          if ( !noticiForm.isValidForm() ) return;
          await noticiasProvider.saveOrCreateProduct(noticiForm.noticia);
        },
      ),
    );
  }
}

class _formulario extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final noticiasForm = Provider.of<NoticiasFormularioProvider>(context);
    final noticia = noticiasForm.noticia;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _boxdecoration(),
        child: Form(
          key: noticiasForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(height: 10,),
              TextFormField(initialValue: noticia.titulo,onChanged: (value)=> noticia.titulo = value,
                decoration: InputDecorations.authInputDecoration(hintText: 'Titulo de noticia', labelText: 'Titulo'),
              ),
              SizedBox(height: 10,),
              TextFormField(initialValue: noticia.desarrollo,onChanged: (value)=> noticia.desarrollo = value,
                decoration: InputDecorations.authInputDecoration(hintText: 'Cuerpo de noticia', labelText: 'Cuerpo'),
              ),
              SizedBox(height: 10,),

              /*TextFormField(keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(hintText: '\$0000000', labelText: 'precio'),),
              SizedBox(height: 10,),
              SwitchListTile.adaptive(value: true, onChanged: (value){})*/
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxdecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25),topLeft: Radius.circular(25),topRight: Radius.circular(25)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: Offset(0,5),
        blurRadius: 5
      )
    ]
  );
}
import 'package:flutter/material.dart';
import 'package:tickets/models/noticias.dart';
class NoticiasFormularioProvider extends ChangeNotifier{
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Noticia noticia;
  NoticiasFormularioProvider(this.noticia);
  bool isValidForm(){
    return formKey.currentState?.validate()?? false;
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tickets/models/noticias.dart';
import 'package:http/http.dart' as http;

class NoticiaProvider extends ChangeNotifier{
  final String _baseurl = 'flutterproyectodam-default-rtdb.firebaseio.com';
  final List<Noticia> noticias=[];   //Esto en final pq no quiero destruir el obj y volverlo asignar,solo quiero cambiar los valores internos
  late Noticia selectedNoticia;    //el late sirve para cuando se va a utlizar este tendra un valor

  bool isLoading = true;  //No es final pq va a ir cambiando entre true y false
  bool isSaving = false;

  NoticiaProvider(){
    this.LoadNoticia();
  }

  Future LoadNoticia() async{
    this.isLoading = true;
    notifyListeners();   // esto notifica a otro widget cuando esta cargando


    final url = Uri.https( _baseurl, 'noticias.json'); // va hacer la peticion
    final resp = await http.get( url ); //obtiene la resputa

    final Map<String, dynamic> noticiasMap = json.decode( resp.body );// se usa json decode pq la respuesta viene en formato json

    noticiasMap.forEach((key, value) {
      final tempProduct = Noticia.fromMap( value );
      tempProduct.id = key;
      this.noticias.add( tempProduct );
    });

    this.isLoading = false;
    notifyListeners();
    return this.noticias;
  }


  Future saveOrCreateProduct(Noticia noticia) async{
    isSaving = true;
    notifyListeners();
    if(noticia.id == null){
      await this.creaNoticia(noticia);
    }
    isSaving = false;
    notifyListeners();
  }


    Future<String> creaNoticia(Noticia noticia) async{
    final url = Uri.https( _baseurl, 'noticias.json'); // va hacer la peticion
    final resp = await http.post( url,body: noticia.toJson() ); //obtiene la resputa
    final decodedData = json.decode(resp.body);
    noticia.id = decodedData['titulo'];
    this.noticias.add(noticia);
    return '';
    }
}
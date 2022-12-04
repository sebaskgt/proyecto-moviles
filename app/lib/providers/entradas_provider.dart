import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class EventosProvider {
  final apiURL = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getEntradas() async {
    var respuesta = await http.get(Uri.parse(apiURL + '/entradas'));

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> agregarEntrada(
      String idEvento, int numero_entrada, String cliente_id) async {
    var respuesta = await http.post(
      Uri.parse(apiURL + '/entradas'),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'idEvento': idEvento,
        'numero_entrada': numero_entrada,
        'cliente_id': cliente_id,
      }),
    );

    return json.decode(respuesta.body);
  }

  Future<LinkedHashMap<String, dynamic>> getEntrada(
      String idEvento, int numero_entrada) async {
    var respuesta = await http.get(Uri.parse(
        apiURL + '/entradas/' + numero_entrada.toString() + idEvento));
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return LinkedHashMap();
    }
  }
}

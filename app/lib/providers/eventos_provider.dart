import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EventosProvider {
  final apiURL = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getEventos() async {
    var respuesta = await http.get(Uri.parse(apiURL + '/eventos'));
    if (respuesta.statusCode == 200) {
      return jsonDecode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> agregarEvento(String cod_evento,
      String nombre, DateTime fecha_evento, int estado) async {
    var respuesta = await http.post(
      Uri.parse(apiURL + '/eventos'),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'cod_evento': cod_evento,
        'nombre': nombre,
        'fecha_evento': fecha_evento,
        'estado': estado,
      }),
    );

    return json.decode(respuesta.body);
  }

  Future<bool> borrarEvento(String cod_evento) async {
    var respuesta =
        await http.delete(Uri.parse(apiURL + '/eventos/' + cod_evento));
    return respuesta.statusCode == 200;
  }

  Future<LinkedHashMap<String, dynamic>> getEvento(String cod_evento) async {
    var respuesta =
        await http.get(Uri.parse(apiURL + '/eventos/' + cod_evento));
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return LinkedHashMap();
    }
  }

  Future<LinkedHashMap<String, dynamic>> editarEvento(
      String cod_evento_actual,
      String cod_evento_nuevo,
      String nombre,
      DateTime fecha_evento,
      int estado) async {
    var respuesta = await http.put(
      Uri.parse(apiURL + '/eventos/' + cod_evento_actual),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'cod_evento': cod_evento_nuevo,
        'nombre': nombre,
        'fecha_evento': fecha_evento,
        'estado': estado,
      }),
    );

    return json.decode(respuesta.body);
  }
}

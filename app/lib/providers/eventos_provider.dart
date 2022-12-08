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

  Future<LinkedHashMap<String, dynamic>> agregarEvento(
      String idEvento,
      String nombre,
      String descripcion,
      String fecha_evento,
      int entradas,
      int precio) async {
    var respuesta = await http.post(
      Uri.parse(apiURL + '/eventos'),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'idEvento': idEvento,
        'nombre': nombre,
        'descripcion': descripcion,
        'estado': 'VIGENTE',
        'fechaEvento': fecha_evento,
        'entradas': entradas,
        'precio': precio,
      }),
    );

    return json.decode(respuesta.body);
  }

  Future<bool> borrarEvento(String idEvento) async {
    var respuesta =
        await http.delete(Uri.parse(apiURL + '/eventos/' + idEvento));
    return respuesta.statusCode == 200;
  }

  Future<LinkedHashMap<String, dynamic>> getEvento(String idEvento) async {
    var respuesta = await http.get(Uri.parse(apiURL + '/eventos/' + idEvento));
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return LinkedHashMap();
    }
  }

  Future<LinkedHashMap<String, dynamic>> editarEstado(
    String idEvento_actual,
    String nombre,
    String descripcion,
    String fecha_evento,
    int entradas,
    int precio,
  ) async {
    var respuesta = await http.put(
      Uri.parse(apiURL + '/eventos/' + idEvento_actual),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'idEvento': idEvento_actual,
        'nombre': nombre,
        'descripcion': descripcion,
        'estado': 'EXPIRADO',
        'fechaEvento': fecha_evento,
        'entradas': entradas,
        'precio': precio,
      }),
    );

    return json.decode(respuesta.body);
  }

  Future<LinkedHashMap<String, dynamic>> editarEvento(
    String idEvento_actual,
    String idEvento_nuevo,
    String nombre,
    String descripcion,
    String fecha_evento,
    int entradas,
    int precio,
  ) async {
    var respuesta = await http.put(
      Uri.parse(apiURL + '/eventos/' + idEvento_actual),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'idEvento': idEvento_nuevo,
        'nombre': nombre,
        'descripcion': descripcion,
        'estado': 'VIGENTE',
        'fechaEvento': fecha_evento,
        'entradas': entradas,
        'precio': precio,
      }),
    );

    return json.decode(respuesta.body);
  }
}

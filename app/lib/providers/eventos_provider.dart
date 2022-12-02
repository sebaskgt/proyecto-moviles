import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EventosProvider{
  final apiURL = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getEventos() async {
    var respuesta = await http.get(Uri.parse(apiURL + '/eventos'));
    if (respuesta.statusCode == 200) {
      return jsonDecode(respuesta.body);
    } else {
      return [];
    }
  }
}
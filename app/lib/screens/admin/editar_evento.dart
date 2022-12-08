import 'package:flutter/material.dart';
import 'package:tickets/providers/eventos_provider.dart';
import 'package:intl/intl.dart';

class EditarEventoPage extends StatefulWidget {
  String idEvento;

  EditarEventoPage(this.idEvento, {Key? Key}) : super(key: Key);

  @override
  State<EditarEventoPage> createState() => _EditarEventoPageState();
}

class _EditarEventoPageState extends State<EditarEventoPage> {
  TextEditingController codigoCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  TextEditingController fechaCtrl = TextEditingController();
  TextEditingController entradasCtrl = TextEditingController();
  TextEditingController precioCtrl = TextEditingController();

  String errCodigo = '';
  String errNombre = '';
  String errDesc = '';
  String errFecha = '';
  String errEntradas = '';
  String errPrecio = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Evento'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
          future: EventosProvider().getEvento(widget.idEvento),
          builder: (context, AsyncSnapshot snap) {
            if (!snap.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var evento = snap.data;
            codigoCtrl.text = evento['idEvento'];
            nombreCtrl.text = evento['nombre'];
            descCtrl.text = evento['descripcion'];
            fechaCtrl.text = evento['fechaEvento'];
            entradasCtrl.text = evento['entradas'].toString();
            precioCtrl.text = evento['precio'].toString();

            return Form(
              child: Column(
                children: [
                  Container(
                    child: Text('Editando Evento: ' + widget.idEvento,
                        style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        campoCodigo(),
                        mostrarError(errCodigo),
                        campoNombre(),
                        mostrarError(errNombre),
                        campoDesc(),
                        mostrarError(errDesc),
                        campoFecha(),
                        mostrarError(errFecha),
                        campoEntradas(),
                        mostrarError(errEntradas),
                        campoPrecio(),
                        mostrarError(errPrecio),
                        botonEditar()
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Container mostrarError(String error) {
    return Container(
      width: double.infinity,
      child: Text(
        error,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  TextFormField campoCodigo() {
    return TextFormField(
      controller: codigoCtrl,
      decoration: InputDecoration(labelText: 'Código del Evento'),
      //keyboardType: TextInputType.number
    );
  }

  TextFormField campoNombre() {
    return TextFormField(
      controller: nombreCtrl,
      decoration: InputDecoration(labelText: 'Nombre del Evento'),
      //keyboardType: TextInputType.number
    );
  }

  TextFormField campoDesc() {
    return TextFormField(
      controller: descCtrl,
      decoration: InputDecoration(labelText: 'Descripción'),
      //keyboardType: TextInputType.number
    );
  }

  TextFormField campoFecha() {
    return TextFormField(
      controller: fechaCtrl,
      decoration: InputDecoration(
          icon: Icon(Icons.calendar_today), labelText: 'Fecha del Evento'),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2100));
        if (pickedDate != null) {
          String formateDate = DateFormat('dd-MM-yyyy').format(pickedDate);
          setState(() {
            fechaCtrl.text = formateDate;
          });
        }
      },
    );
  }

  TextFormField campoEntradas() {
    return TextFormField(
        controller: entradasCtrl,
        decoration: InputDecoration(labelText: 'Cantidad de Entradas'),
        keyboardType: TextInputType.number);
  }

  TextFormField campoPrecio() {
    return TextFormField(
        controller: precioCtrl,
        decoration: InputDecoration(labelText: 'Precio de la entrada'),
        keyboardType: TextInputType.number);
  }

  Container botonEditar() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.purple),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.edit), Text('Guardar Cambios')],
        ),
        onPressed: () async {
          //capturar datos del form
          String cod_evento = codigoCtrl.text.trim();
          String nombre = nombreCtrl.text.trim();
          String desc = descCtrl.text.trim();
          String fecha = fechaCtrl.text.trim();
          int precio = int.tryParse(precioCtrl.text.trim()) ?? 0;
          int entradas = int.tryParse(entradasCtrl.text.trim()) ?? 0;
          //enviar por post a la api
          var respuesta = await EventosProvider().editarEvento(widget.idEvento,
              cod_evento, nombre, desc, fecha, entradas, precio);
          //manejar errores
          if (respuesta['message'] != null) {
            var errores = respuesta['errors'];
            errCodigo =
                errores['idEvento'] != null ? errores['idEvento'][0] : '';
            errNombre = errores['nombre'] != null ? errores['nombre'][0] : '';
            errPrecio = errores['precio'] != null ? errores['precio'][0] : '';
            errEntradas =
                errores['entradas'] != null ? errores['entradas'][0] : '';
            errDesc =
                errores['descripcion'] != null ? errores['descripcion'][0] : '';
            errFecha =
                errores['fechaEvento'] != null ? errores['fechaEvento'][0] : '';

            setState(() {});
            return;
          }
          //redireccionar a pagina que lista productos
          Navigator.pop(context);
        },
      ),
    );
  }
}

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VistaUsuario extends StatefulWidget {
  const VistaUsuario({key});

  @override
  State<VistaUsuario> createState() => _VistaUsuarioState();
}

class _VistaUsuarioState extends State<VistaUsuario> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pushNamed(context, '/loginPage');
          },
          child: Text('Cerrar Sesion'),
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginv1.dart';

class VistaUsuario extends StatefulWidget {
  const VistaUsuario({key});

  @override
  State<VistaUsuario> createState() => _VistaUsuarioState();
}

class _VistaUsuarioState extends State<VistaUsuario> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = GoogleSignIn();
  Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _firebaseAuth.signOut();
            _googleSignIn.signOut();
            Navigator.of(context).pop();
          },
          child: Text('Cerrar Sesion'),
        ),
      ),
    );
  }
}

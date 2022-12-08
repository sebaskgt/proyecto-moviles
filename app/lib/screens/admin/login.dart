import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tickets/screens/admin/loginv1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () async {
            User? user = await Loginv1.iniciarSesion(context: context);

            if ((user?.email == 'trabajosdvali@gmail.com' ||
                user?.email == 'liquitay2010@gmail.com' ||
                user?.email == 'rjm.madrid.diego@gmail.com')&&user?.email != null) {
              Navigator.of(context).pushNamed('/controllerTab');
            }
          },
          color: Colors.blue,
          child: Icon(FontAwesomeIcons.google),
          textColor: Colors.white,
        ),
      ),
    );
  }
}

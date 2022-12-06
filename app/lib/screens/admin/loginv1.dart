import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Loginv1{
  static Future<User?> iniciarSesion({required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    
    GoogleSignIn objGoogleSingIn = GoogleSignIn();
    GoogleSignInAccount? objGoogleSingInAccount = await objGoogleSingIn.signIn();
    if(objGoogleSingInAccount != null){
      GoogleSignInAuthentication objGoogleSingInAuthendification = await objGoogleSingInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: objGoogleSingInAuthendification.accessToken,
        idToken: objGoogleSingInAuthendification.idToken
      );
      try{
        UserCredential userCredential = await auth.signInWithCredential(credential);
        user = userCredential.user;
        return user;
      }on FirebaseAuthException catch(e){
        print('error en la autentificacion');

      }
    }
  }
}
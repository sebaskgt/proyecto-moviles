import 'package:flutter/material.dart';
import 'package:tickets/models/noticias.dart';
import 'package:tickets/provider/noticiaprodiver.dart';
import 'package:tickets/screens/admin/editar_page.dart';
import 'package:tickets/screens/admin/homePage.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tickets/screens/admin/login.dart';

void main() {
  runApp( AppState());
}
class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NoticiaProvider())
      ],
      child: MyApp(),
    );
  }
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0xFFcfccbb),
        appBarTheme:AppBarTheme(
          elevation: 0,
          color: Color(0xFF5d544d),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.indigo,elevation: 0)
      ),
      home: Login(),
      routes: <String, WidgetBuilder> {
        '/HomePage':(context) => new HomePage(),
        '/editarPage': (BuildContext context) => new Editar_Page(),
        '/loginPage':(context) => new Login(),
        
        },
      debugShowCheckedModeBanner: false,
    );
  }
}

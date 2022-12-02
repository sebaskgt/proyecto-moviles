import 'package:flutter/material.dart';
import 'package:app/screens/admin/homePage.dart';

void main() {
  runApp(const MyApp());
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
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

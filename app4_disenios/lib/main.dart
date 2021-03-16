import 'package:app4_disenios/src/pages/basico_page.dart';
import 'package:app4_disenios/src/pages/scroll_page.dart';
import 'package:flutter/material.dart'; 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'intermedio',
      routes: {
        'basico': (BuildContext context) => BasicoPage(),
        'intermedio': (BuildContext context) => ScrollPage(),
        //'avanzado': (BuildContext context) => AvanzadoPage(),
      },
    );
  }
}
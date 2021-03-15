import 'package:app4_disenios/src/pages/basico_page.dart';
import 'package:flutter/material.dart'; 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      routes: {
        '/': (BuildContext context) => BasicoPage(),
        //'itermedio': (BuildContext context) => IntermedioPage(),
        //'avanzado': (BuildContext context) => AvanzadoPage(),
      },
    );
  }
}
import 'package:app4_disenios/src/pages/basico_page.dart';
import 'package:app4_disenios/src/pages/botones_page.dart';
import 'package:app4_disenios/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white
      ),
      
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'avanzado',
      routes: {
        'basico': (BuildContext context) => BasicoPage(),
        'intermedio': (BuildContext context) => ScrollPage(),
        'avanzado': (BuildContext context) => BotonesPage(),
      },
    );
  }
}
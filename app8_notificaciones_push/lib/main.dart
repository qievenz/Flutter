import 'package:app8_notificaciones_push/src/pages/mensaje_page.dart';
import 'package:flutter/material.dart';

import 'src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notificaciones Push',
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => HomePage(),
        MensajePage.route: (context) => MensajePage(),
      }
    );
  }
}
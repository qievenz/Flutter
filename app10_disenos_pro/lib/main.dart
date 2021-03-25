import 'package:app10_disenos_pro/src/challenges/cuadrado_animado_page.dart';
import 'package:app10_disenos_pro/src/pages/animaciones_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños PRO',
      home: CuadradoAnimadoPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'src/pages/graficas_circulares_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños PRO',
      home: GraficasCircularesPage(),
    );
  }
}

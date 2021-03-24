import 'package:flutter/material.dart';
import 'src/pages/headers_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños PRO',
      home: HeadersPage(),
    );
  }
}
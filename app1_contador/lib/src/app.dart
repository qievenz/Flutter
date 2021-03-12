import 'package:app1_contador/src/pages/contador_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContadorPage(),
    );
  }

}
import 'package:app7_patron_bloc_validacion_formularios/bloc/provider.dart';
import 'package:app7_patron_bloc_validacion_formularios/src/pages/home_page.dart';
import 'package:app7_patron_bloc_validacion_formularios/src/pages/login_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
        },
      )
    );
  }
}
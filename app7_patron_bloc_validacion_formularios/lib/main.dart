import 'package:app7_patron_bloc_validacion_formularios/bloc/provider.dart';
import 'package:app7_patron_bloc_validacion_formularios/src/pages/home_page.dart';
import 'package:app7_patron_bloc_validacion_formularios/src/pages/login_page.dart';
import 'package:app7_patron_bloc_validacion_formularios/src/pages/producto_page.dart';
import 'package:app7_patron_bloc_validacion_formularios/src/pages/registro_page.dart';
import 'package:flutter/material.dart';

import 'src/share_prefs/preferencias_usuario.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
} 
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        color: Colors.deepPurple,
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'producto': (BuildContext context) => ProductoPage(),
          'registro': (BuildContext context) => RegistroPage(),
        },
      )
    );
  }
}
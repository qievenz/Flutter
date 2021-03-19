import 'package:app6_preferencias_usuario/src/pages/home_page.dart';
import 'package:app6_preferencias_usuario/src/pages/settings_page.dart';
import 'package:app6_preferencias_usuario/src/share_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
} 
 
class MyApp extends StatelessWidget {
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias',
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        SettingsPage.routeName: (_) => SettingsPage(),
      },
    );
  }
}
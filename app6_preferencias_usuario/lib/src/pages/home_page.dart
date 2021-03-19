import 'package:app6_preferencias_usuario/src/share_prefs/preferencias_usuario.dart';
import 'package:app6_preferencias_usuario/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre de usuario: ${prefs.nombre}'),
          Divider(),
        ],
      ),
    );
  }
}
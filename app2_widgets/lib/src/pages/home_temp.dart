import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['2', '5', 'seis', 'siete'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes temp')
      ),
      body: ListView(
        //children: _crearItems()
        children: _crearListaCorta()
      ),
    );
  }

  List<Widget> _crearItems() {

    List<Widget> lista = [];

    for (var opcion in opciones) {
      
      final listTile = ListTile(
        title: Text(opcion),
      );

      lista..add(listTile)
           ..add(Divider());
    }

    return lista;
  }

  List<Widget> _crearListaCorta() {
    return opciones.map((item) {

      return Column(
        children: [
          ListTile(
            title: Text(item + '!')
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
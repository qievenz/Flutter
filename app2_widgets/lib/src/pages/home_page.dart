import 'package:app2_widgets/src/providers/menu_provider.dart';
import 'package:app2_widgets/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes')
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //menuProvider.cargarData().then((value) => {});

    return FutureBuilder(
      future: menuProvider.cargarData(),
      //initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
        
        return ListView(
          children: _listaItems(snapshot.data, context)

        );
      },
      );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach( (opt) {
      opciones..add(
        ListTile(
          title: Text(opt['texto']),
          leading: getIcon(opt['icon']),
          trailing: Icon(Icons.arrow_right),
          onTap: () {

            //final route = MaterialPageRoute(builder: (context) => AlertPage());

            //Navigator.push(context, route);

            Navigator.pushNamed(context, opt['ruta']);

          },
        )
      )
      ..add(Divider());
    });
    
    return opciones;
  }
}

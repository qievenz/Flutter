import 'package:app6_preferencias_usuario/src/share_prefs/preferencias_usuario.dart';
import 'package:app6_preferencias_usuario/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;

  TextEditingController _textController;

  final prefs = PreferenciasUsuario();

  @override
  void initState() {
    super.initState();

    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;

    _textController = TextEditingController(
      text: prefs.nombre
    );

    prefs.ultimaPagina = SettingsPage.routeName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),),
            padding: EdgeInsets.all(5.0),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario, 
            onChanged: (value) => setState(()  {
              _colorSecundario = value;
              prefs.colorSecundario = value;
            }),
            title: Text('Color Secundario'),
          ),
          RadioListTile(
            value: 1, 
            groupValue: _genero, 
            onChanged: _setearOpcionRadio,
            title: Text('Masculino'),
          ),
          RadioListTile(
            value: 2, 
            groupValue: _genero, 
            onChanged: _setearOpcionRadio,
            title: Text('Femenino'),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'El nombre bra'
              ),
              onChanged: (value) => setState(()  {
              //_nombre = value;
              prefs.nombre = value;
            }),
            ),
          ),
        ],
      ),
    );
  }

  _setearOpcionRadio(int value) {
    prefs.genero = value;
    setState(()  =>_genero = value);
  }

}
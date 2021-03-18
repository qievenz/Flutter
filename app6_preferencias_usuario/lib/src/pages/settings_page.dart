import 'package:app6_preferencias_usuario/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = 'Pedro';

  TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    _obtenerOpcionRadio();

    _textController = TextEditingController(
      text: _nombre
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
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
            onChanged: (value) => setState(()  =>_colorSecundario = value),
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
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _setearOpcionRadio(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('genero', value);

    setState(()  =>_genero = value);
  }

  Future<void> _obtenerOpcionRadio() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _genero = prefs.getInt('genero');

    setState(() {});
  }
}
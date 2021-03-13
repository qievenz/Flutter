import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 10.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckboxListTile(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        ),
      ),
    );
  }

  _crearSlider() {
    return Slider(
      value: _valorSlider,
      label: 'Tamaño de la imagen',
      //divisions: 20,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck) ? null : (valor) { 
        setState(() {
          _valorSlider = valor;
        });
      }
    );
  }

  _crearImagen() {
    return Image(
      image: NetworkImage('https://www.eluniversal.com.mx/sites/default/files/2020/08/31/batman-guiara-tu-camino-por-la-ciudad-a-traves-de-waze.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain
    );
  }

  _crearCheckboxListTile() {
      return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _bloquearCheck, 
      onChanged: (valor) => setState(()  => _bloquearCheck = valor),
    );
  }

  _crearCheckbox() {
    return Checkbox(
      value: _bloquearCheck, 
      onChanged: (valor) => setState(() => _bloquearCheck = valor),
    );
  }

  _crearSwitch() {
    return Switch(
      value: _bloquearCheck, 
      onChanged: (valor) => setState(() => _bloquearCheck = valor),
    );
  }

}
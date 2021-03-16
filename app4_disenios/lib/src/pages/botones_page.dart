import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _fondo(),
          SingleChildScrollView(
            child: Column(
              children: [
                _titulos(),
                _botonesRedondeados(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
      /*bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outline_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: '',
          ),
        ],
      ),*/
    );
  }

  _fondo() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52,54,101,1.0),
            Color.fromRGBO(35,37,57,1.0),
          ]
        )
      ),
    );

    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236,98,188,1.0),
              Color.fromRGBO(241,142,172,1.0),
            ],
          ),
        ),
      ),
    );

    return Stack(
      children: [
        gradiente,
        Positioned(
          top: -100,
          child: cajaRosa
        ),
      ],
    );
  }

  _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Classify transaccion', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
            SizedBox(height: 20.0,),
            Text('Classify this transaction into particular category', style: TextStyle(color: Colors.white, fontSize: 18.0)),
          ],
        ),
      )
    );
  }

  _bottomNavigationBar(context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
          caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0))
        )
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outline_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: '',
          ),
        ],
      ),
    );
  }

  _botonesRedondeados() {
    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado(Icons.border_all, Colors.blue, 'General'),
            _crearBotonRedondeado(Icons.directions, Colors.purpleAccent, 'Rutas'),
          ],
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(Icons.ac_unit_outlined, Colors.green, 'asd'),
            _crearBotonRedondeado(Icons.ac_unit_outlined, Colors.white, 'asd'),
          ],
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(Icons.ac_unit_outlined, Colors.white, 'asd'),
            _crearBotonRedondeado(Icons.ac_unit_outlined, Colors.white, 'asd'),
          ],
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(Icons.ac_unit_outlined, Colors.white, 'asd'),
            _crearBotonRedondeado(Icons.ac_unit_outlined, Colors.white, 'asd'),
          ],
        ),
      ],
    );
  }

  _crearBotonRedondeado(IconData icono, Color color, String nombre) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: 180.0,
            //margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              //borderRadius: BorderRadius.circular(20.0)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 20.0),
                CircleAvatar(
                  backgroundColor: Colors.pinkAccent,
                  radius: 35.0,
                  child: Icon(icono, color: color, size: 30.0,)
                ),
                Text(nombre, style: TextStyle(color: color),),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
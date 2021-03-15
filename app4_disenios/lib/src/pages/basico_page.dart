import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _crearImagen(),

              _crearTItulo(),

              _crearBotones(),

              _crearDescripcion(),
              _crearDescripcion(),
              _crearDescripcion(),
              _crearDescripcion(),

            ],
          ),
        ),
      )
    );
  }

  Image _crearImagen() {
    return Image(
      image: NetworkImage('https://concepto.de/wp-content/uploads/2015/03/paisaje-e1549600034372.jpg'),
    );
  }

  Padding _crearTItulo() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Lago con flores y montaña', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                Text('Donde ejeso', style: TextStyle(fontSize: 18.0)),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red,),
          Text('4.7', style: TextStyle(fontSize: 18.0),),
        ],
      ),
    );
  }

  _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _crearBoton(Icons.phone, 'CALL'),
        _crearBoton(Icons.near_me_sharp, 'ROUTE'),
        _crearBoton(Icons.share, 'SHARE'),
      ],
    );
  }

  _crearBoton(IconData icono, String nombre){
    return Column(
      children: [
        Icon(icono, color: Colors.blue, size: 50.0,),
        Text(nombre.toUpperCase(), style: TextStyle(color: Colors.blue, fontSize: 18.0)),
      ],
    );
  }

  _crearDescripcion() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text('In incididunt duis consectetur sunt ipsum nostrud voluptate velit ipsum eu. Tempor ea proident commodo deserunt non id. Sit ut nostrud aliqua enim consequat ad non magna Lorem in. Minim veniam occaecat cillum occaecat nulla officia deserunt officia aliquip.',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
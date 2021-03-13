import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(

          duration: Duration(seconds: 1),
          curve: Curves.bounceIn,

          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadiusGeometry,
            color: _color
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow_outlined),
        onPressed: _cambiarPropiedades,
      ),
    );
  }

  _cambiarPropiedades() {
    var randNumber = new Random();
    setState(() {
      _width = randNumber.nextInt(300).toDouble();
      _height = randNumber.nextInt(300).toDouble();
      _color = Color((randNumber.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
      _borderRadiusGeometry = BorderRadius.circular(randNumber.nextInt(50).toDouble());
    });
  }
}
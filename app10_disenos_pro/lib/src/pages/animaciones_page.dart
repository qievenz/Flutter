import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key key,
  }) : super(key: key);

  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{

  AnimationController _controller; //Es como la barra de reproduccion, te permite reproducir, pausar etc

  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> opacidadOut;
  Animation<double> moverDerecha;
  Animation<double> agrandar;
  
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000)  //En 4 segundos...
    );

    rotacion = Tween(     //...la rotacion pasa de 0 a 2
      begin: 0.0,
      end: 4.0 * Math.pi
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut)
    );

    opacidad = Tween(
      begin: 0.1,
      end: 1.0
    ).animate(CurvedAnimation(
      parent: _controller, 
      curve: Interval(0, 0.25, curve: Curves.linear))
    );

    moverDerecha = Tween(
      begin: 0.0,
      end: 150.0,
    ).animate( _controller);

    agrandar = Tween(
      begin: 0.0,
      end: 5.0,
    ).animate( _controller);

    _controller.addListener(() {
      //print(_controller.status);
      if (_controller.status == AnimationStatus.completed) {
        //_controller.reverse();
      }
    });

    opacidadOut = Tween(  //En la clase tira otra solucion, restando
      begin: 1.0,
      end: 0.1
    ).animate(CurvedAnimation(
      parent: _controller, 
      curve: Interval(0.25, 1, curve: Curves.linear))
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    _controller.forward();  //play, reproducir
    return AnimatedBuilder(
      animation: _controller,
      child: _Rectangulo(), //Mandarlo aca es opcional o mandarlo en el builder
      builder: (BuildContext context, Widget child) { //Mandarlo por child el widget se pasa una sola vez y se maneja por referencia, es mas eficiente
        // print('Rotacion: ${rotacion.value}');
        // print('Opacidad: ${opacidad.value}');
        // print('Status: ${_controller.status}');
        return Opacity(
          opacity: opacidadOut.value,
          child: Transform.scale(
            scale: agrandar.value,
            child: Transform.translate(
              offset: Offset(moverDerecha.value, 0),
              child: Transform.rotate(
                child: Opacity(
                  child: child,
                  opacity: opacidad.value,
                ),
                angle: rotacion.value,
              ),
            ),
          ),
        );
      },
    );
  }
}


class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.blue
        ),
      );
    }
}
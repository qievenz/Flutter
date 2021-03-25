import 'dart:ui';

import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CuadradoAnimado()),
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
  AnimationController controller;

  Animation<double> moverDerecha;
  Animation<double> moverArriba;
  Animation<double> moverIzquierda;
  Animation<double> moverAbajo;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4500)
    );

    moverDerecha = Tween(
      begin: 0.0, end: 100.0
    ).animate(CurvedAnimation(
      parent: controller,
       curve: Interval(0.0 , 0.25, curve: Curves.bounceOut)
    ));

    moverArriba = Tween(
      begin: 0.0, end: -100.0
    ).animate(CurvedAnimation(
      parent: controller,
       curve: Interval(0.25 , 0.50, curve: Curves.bounceOut)
    ));

    moverIzquierda = Tween(
      begin: 0.0, end: -100.0
    ).animate(CurvedAnimation(
      parent: controller,
       curve: Interval(0.50 , 0.75, curve: Curves.bounceOut)
    ));

    moverAbajo = Tween(
      begin: 0.0, end: 100.0
    ).animate(CurvedAnimation(
      parent: controller,
       curve: Interval(0.75 , 1, curve: Curves.bounceOut)
    ));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (context, child) 
      {
        return Transform.translate(
          offset: Offset(moverDerecha.value + moverIzquierda.value, moverArriba.value + moverAbajo.value),
          child: child,
        );
        // return Transform.translate(
        //   offset: Offset(0, moverAbajo.value),
        //   child: Transform.translate(
        //     offset: Offset(moverIzquierda.value, 0),
        //     child: Transform.translate(
        //       offset: Offset(0, moverArriba.value),
        //       child: Transform.translate(
        //         offset: Offset(moverDerecha.value, 0),
        //         child: child
        //       ),
        //     ),
        //   ),
        // );
      }
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
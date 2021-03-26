import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcentaje;
  final double size;
  final Color colorPrimario;
  final double grosorSecundario;
  final Color colorSecundario;
  final double grosorPrimario;

  const RadialProgress({
    Key key, 
    @required this.porcentaje, 
    @required this.size,
    this.colorPrimario = Colors.blue, 
    this.grosorSecundario = 5, 
    this.colorSecundario = Colors.grey, 
    this.grosorPrimario = 10, 
  }) : super(key: key);

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{
  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        // print('widget.porcentaje: ${widget.porcentaje}');
        // print('porcentajeAnterior: ${porcentajeAnterior}');
        // print('controller.value : ${controller.value }');
        // print('diferenciaAnimar: ${diferenciaAnimar}');
        final progress = (widget.porcentaje - diferenciaAnimar) + (controller.value * diferenciaAnimar);

        return Container(
          width: widget.size,
          height: widget.size,
          child: CustomPaint(
            painter: _RadialProgressPainter(
              progress,
              widget.grosorSecundario,
              widget.colorSecundario,
              widget.grosorPrimario,
              widget.colorPrimario,
            ),
          ),
        );
      },
    );
    
  }
}

class _RadialProgressPainter extends CustomPainter{
  final double porcentaje;
  final double grosorSecundario;
  final Color colorSecundario;
  final double grosorPrimario;
  final Color colorPrimario;

  const _RadialProgressPainter(
    this.porcentaje, 
    this.grosorSecundario, 
    this.colorSecundario, 
    this.grosorPrimario,
    this.colorPrimario, 
  );

  @override
  void paint(Canvas canvas, Size size) {
    
    // final gradiente = LinearGradient(
    //   colors: colors
    // );

    final paint = Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    // arco
    final paintArco = Paint()
      ..strokeWidth = grosorPrimario
      ..color = colorPrimario
      //..shader = gradiente.shade  // Esto para aplicar un gradiente [https://www.udemy.com/course/flutter-disenos-y-animaciones/learn/lecture/19262776]
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio), 
      -pi / 2, 
      arcAngle, 
      false, 
      paintArco);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}
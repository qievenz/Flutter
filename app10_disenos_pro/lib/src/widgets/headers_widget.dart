import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.deepPurple,
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
        color: Colors.deepPurple,

      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainer(),
      )
    );
  }
}

class _HeaderDiagonalPainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
      final paint = Paint(); //Lapiz

      paint.color = Colors.deepPurple;
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5.0;

      final path = Path();

      path.moveTo(0, size.height * 0.35);
      path.lineTo(size.width, size.height * 0.3);
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
      //path.lineTo(0, size.height * 0.5);

      canvas.drawPath(path, paint);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainer(),
      )
    );
  }
}

class _HeaderTriangularPainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
      final paint = Paint();

      paint.color = Colors.deepPurple;
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5.0;

      final path = Path();

      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
      //path.lineTo(0, size.height);

      canvas.drawPath(path, paint);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}



class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainer(),
      )
    );
  }
}

class _HeaderPicoPainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
      final paint = Paint();

      paint.color = Colors.deepPurple;
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5.0;

      final path = Path();

      path.lineTo(0, size.height * 0.3);
      path.lineTo(size.width * 0.5, size.height * 0.40);
      path.lineTo(size.width, size.height * 0.3);
      path.lineTo(size.width, 0);

      canvas.drawPath(path, paint);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}



class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainer(),
      )
    );
  }
}

class _HeaderCurvoPainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
      final paint = Paint();

      paint.color = Colors.deepPurple;
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5.0;

      final path = Path();

      path.lineTo(0, size.height * 0.3);
      path.quadraticBezierTo(size.width * 0.5, size.height * 0.6, size.width, size.height * 0.3);
      path.lineTo(size.width, 0);

      canvas.drawPath(path, paint);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class HeaderWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainer(),
      )
    );
  }
}

class _HeaderWavePainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
      final paint = Paint();

      paint.color = Colors.deepPurple;
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5.0;

      final path = Path();

      path.lineTo(0, size.height * 0.25);
      path.quadraticBezierTo(size.width * 0.25, size.height * 0.45, size.width * 0.5, size.height * 0.25);
      path.quadraticBezierTo(size.width * 0.75, size.height * 0.08, size.width, size.height * 0.25);
      path.lineTo(size.width, 0);

      canvas.drawPath(path, paint);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class HeaderWaveGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientPainer(),
      )
    );
  }
}

class _HeaderWaveGradientPainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
      final rect = Rect.fromCircle(
        center: Offset(150, 55),
        radius: 180
      );
      final gradiente = LinearGradient(
        colors: [
          Colors.blue,
          Colors.amber,
          Colors.black
        ]
      );
      
      final paint = Paint()..shader = gradiente.createShader(rect); 

      //paint.color = Colors.deepPurple;
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5.0;

      final path = Path();

      path.lineTo(0, size.height * 0.25);
      path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
      path.quadraticBezierTo(size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
      path.lineTo(size.width, 0);

      canvas.drawPath(path, paint);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const IconHeader({
    @required this.icon, 
    @required this.titulo, 
    @required this.subtitulo, 
    this.color1 = Colors.grey, 
    this.color2 = Colors.blueGrey
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _IconHeaderBackground(
          color1: color1, 
          color2: color2,),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(icon, size: 250, color: Colors.white.withOpacity(0.2))
        ),
        Column(
          children: [
            SizedBox(height: 50, width: double.infinity,),
            Text(titulo, style: TextStyle(fontSize: 20, color: Colors.white),),
            SizedBox(height: 20,),
            Text(subtitulo, style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            FaIcon(icon, size: 80, color: Colors.white)
          ],
        )
      ]
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBackground({
    @required this.color1, 
    @required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color1, color2
          ],
        )
      )

    );
  }
}
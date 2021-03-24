import 'package:flutter/material.dart';

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
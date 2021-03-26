import 'package:app10_disenos_pro/src/widgets/radial_progress_widget.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            porcentaje += 10.0;
            if (porcentaje > 100) {
              porcentaje = 0.0;
            }
          });
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: RadialProgress(
          porcentaje: porcentaje,
          size: double.infinity,
          colorPrimario: Colors.pinkAccent,
          colorSecundario: Colors.white,
          ),
      ),
    );
  }
}
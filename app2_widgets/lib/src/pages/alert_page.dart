import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit_outlined),
        onPressed: () => Navigator.pop(context),
        ),

      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar alerta'),
          onPressed: () => _mostrarAlerta(context),
        ),
      ),
    
    );
  }

  _mostrarAlerta(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context, 
      builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text('Titulo'),
        content: Text('Contenido'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), 
            child: Text('Ok')
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(), 
            child: Text('Cancelar')
          )
        ],
      ),
    );
  }
}
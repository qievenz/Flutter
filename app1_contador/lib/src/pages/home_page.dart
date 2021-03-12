import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  final TextStyle estiloTexto = new TextStyle(fontSize: 50);
  final contador = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulazo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Numero de taps:', style: estiloTexto,),
            Text('$contador', style: estiloTexto)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //contador += 1;
        },
        child: Icon(Icons.add),
      ),
    );
  }
  
}
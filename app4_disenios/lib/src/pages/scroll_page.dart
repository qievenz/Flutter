import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          _pagina1(),
          _pagina2(),
        ],
      ),
    );
  }

  _pagina1() {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          _colorFondo(),
          _imagenFondo(),
          _textos(),
        ],
      ),
    );
  }

  _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover
      ),
    );
  }

  _textos() {
    var textStyle = TextStyle(color: Colors.white, fontSize: 50.0);
    
    return Column(
      children: [
        Text('11°', style: textStyle,),
        Text('Miércoles', style: textStyle,),
        Expanded(child: Column()),
        Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.white,),
      ],
    );
  }



  _pagina2() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
      child: Center(
        child: ElevatedButton(
          onPressed: () {  }, 
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Text(
              'Bienvenidos', 
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          style: ButtonStyle(),
        ),
      ),
    );
  }
}
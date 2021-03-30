import 'package:flutter/material.dart';


class NavegacionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      floatingActionButton: BotonFlotante(),
      body: Center(
        child: Text('Hello World'),
     ),
   );
  }
}

class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
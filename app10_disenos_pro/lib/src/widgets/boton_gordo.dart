import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final Function onPress;

  const BotonGordo({
    @required this.icon, 
    @required this.text, 
    @required this.onPress,
    this.color1 = Colors.blue, 
    this.color2 = Colors.blueGrey, 
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _BotonGordoBackground(
          color1: color1,
          color2: color2,
          icon: icon,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 140, width: 40,),
            FaIcon(icon, color: Colors.white, size: 40,),
            SizedBox(width: 20,),
            Expanded(child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18),)),
            FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white,),
            SizedBox(width: 40,),
          ],
        )
      ],
    );
    // return _BotonGordoBackground(
    //   color1: Color(0xff6989f5),
    //   color2: Color(0xff906ef5),
    //   );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  final IconData icon;

  const _BotonGordoBackground({
    this.color1 = Colors.blue, 
    this.color2 = Colors.blueGrey, 
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(icon, size: 150, color: Colors.white.withOpacity(0.2),)
            ),
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            offset: Offset(4,6),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ]
        )
      ),
    );
  }
}
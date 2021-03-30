import 'package:app10_disenos_pro/src/widgets/boton_gordo.dart';
import 'package:app10_disenos_pro/src/widgets/headers_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      //backgroundColor: Colors.red,
      body: Stack(
        children: [
          _PageButtons(),
          _PageHeader(),
        ],
      ),
   );
  }
}

class _ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  _ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

class _PageButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final items = <_ItemBoton>[
      new _ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new _ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new _ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new _ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new _ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new _ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new _ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new _ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new _ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new _ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new _ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new _ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ];

    List<Widget> itemMap = items.map((e) => BotonGordo(
      icon: e.icon,
      color1: e.color1,
      color2: e.color2,
      text: e.texto,
      onPress: () {},
    )).toList();

    return Container(
      margin: EdgeInsets.only(top: 200),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 90,),
          ...itemMap,
        ],
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus, 
          titulo: 'Has solicitado', 
          subtitulo: 'Asistencia médica',
          color1: Color(0xff526bf6),
          color2: Color(0xff67acf2),
        ),
        Positioned(
          right: 0,
          //top: 45,
          child: RawMaterialButton(
            onPressed: () {  },
            shape: CircleBorder(),
            padding: EdgeInsets.all(15),
            child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white,)
          ),
        )
      ],
    );
  }
}
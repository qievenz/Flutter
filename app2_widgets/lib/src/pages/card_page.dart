import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  //const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
        actions: [],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
        ],
      ),
    );
  }

  _cardTipo1() {
    return Card(
      elevation: 20.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.green,),
            title: Text('El titulazo'),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: Text('Cancelar')),
              TextButton(onPressed: (){}, child: Text('Ok'))
            ]
          )
        ],
      ),
    );
  }

  _cardTipo2() {

    var card = Container(
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('data/assets/jar-loading.gif'), 
            image: NetworkImage('https://image.shutterstock.com/image-photo/mountain-valley-road-landscape-260nw-762715789.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover
          ),

          Container(
            padding: EdgeInsets.all(00.0),
          )
        ],
      )
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10.0,
            spreadRadius: 5.0,
            offset: Offset(10, 10)
          ),
        ]
      ),

      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),

      ),

    );

  }
}
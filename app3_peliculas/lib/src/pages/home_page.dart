import 'package:app3_peliculas/src/providers/peliculas_provider.dart';
import 'package:app3_peliculas/src/widgets/card_swiper_widget.dart';
import 'package:app3_peliculas/src/widgets/movie_horizontal.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _peliculasProvider = PeliculasProvider();

  @override
  Widget build(BuildContext context) {

    _peliculasProvider.getPopulares();

    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        centerTitle: false,
        backgroundColor: Colors.indigoAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            _swiperTarjetas(),
            SizedBox(height: 30.0,),
            _footer(context),
          ],
        ),
      ),
    );
  }

  _swiperTarjetas() {

    return FutureBuilder(
      future: _peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiperWidget(peliculas: snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );

  }

  _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 30.0),
            child: Text('Populares', style: Theme.of(context).textTheme.subtitle1,)
          ),
          StreamBuilder(
            stream: _peliculasProvider.popularesStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData){
                return MovieHorizontalWidget(
                  peliculas: snapshot.data, 
                  siguientePagina: _peliculasProvider.getPopulares,
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}
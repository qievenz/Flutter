import 'package:app3_peliculas/src/models/pelicula_model.dart';
import 'package:flutter/material.dart';

class MovieHorizontalWidget extends StatelessWidget {
  final List<Pelicula> peliculas;

  MovieHorizontalWidget({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.2,
      child: PageView(
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3
        ),
        pageSnapping: false,
        children: _tarjetas(context),
      ),
    );
  }

  _tarjetas(context) {
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterUrl()), 
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
            Text(
              pelicula.title, 
              overflow: TextOverflow.ellipsis, 
              style: Theme.of(context).textTheme.caption,
            ),
          ]
        )
      );
    }).toList();
  }
}
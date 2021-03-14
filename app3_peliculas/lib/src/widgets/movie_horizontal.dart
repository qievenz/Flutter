import 'package:app3_peliculas/src/models/pelicula_model.dart';
import 'package:flutter/material.dart';

class MovieHorizontalWidget extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;

  MovieHorizontalWidget({@required this.peliculas, this.siguientePagina});
  
  final _pageController = new PageController(
          initialPage: 1,
          viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    
    _pageController.addListener(() {
      if (_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return Container(
      alignment: Alignment.bottomLeft,
      height: _screenSize.height * 0.27,
      child: PageView.builder(
        controller: _pageController,
        pageSnapping: false,
        //children: _tarjetas(context),
        itemBuilder: (context, index) => _crearTarjeta(context, peliculas[index]),
        //itemBuilder: (context, index) => Text(index.toString()),
        itemCount: peliculas.length,
        clipBehavior: Clip.antiAlias,
      ),
    );
  }
/* Se reemplaza por el crearTarjeta que usa el pageView builder
  _tarjetas(context) {
    return peliculas.map((pelicula) {
      return _crearTarjeta(context, pelicula);
    }).toList();
  }
*/
  Widget _crearTarjeta(context, Pelicula pelicula) {
    print('id: ${pelicula.id}');
    final peliculaTarjeta =  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: FadeInImage(
            image: NetworkImage(pelicula.getPosterUrl()), 
            placeholder: AssetImage('assets/img/no-image.jpg'),
            fit: BoxFit.cover,
            height: 150.0,
          ),
        ),
        Text(
          pelicula.title, 
          overflow: TextOverflow.ellipsis, 
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );

    return GestureDetector(
      child: peliculaTarjeta,
      onTap: () {
        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
    );
  }
}
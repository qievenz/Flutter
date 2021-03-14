import 'package:app3_peliculas/src/models/actor_model.dart';
import 'package:app3_peliculas/src/models/pelicula_model.dart';
import 'package:app3_peliculas/src/providers/peliculas_provider.dart';
import 'package:flutter/material.dart';

class PeliculaDetallePage extends StatelessWidget {
  
  final _pageController = new PageController(
        initialPage: 1,
        viewportFraction: 0.3);
  
  @override
  Widget build(BuildContext context) {

    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    _pageController.addListener(() {
      if ( _pageController.position.pixels <= 50 ){
        _pageController.animateToPage(1, duration: Duration(milliseconds: 3000), curve: Curves.elasticOut);
      }
    });

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _crearAppbar(pelicula),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10.0,),
                _posterTitulo(context, pelicula),
                SizedBox(height: 10.0,),
                Text(pelicula.overview),
                SizedBox(height: 10.0,),
                _crearCasting(pelicula),
              ]
            ),
          ),
        ],
      ),
    );
  }

  _crearAppbar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigo,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0)
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackgroundUrl()), 
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(milliseconds: 100),
          fit: BoxFit.cover
        ),
      ),
    );
  }

  _posterTitulo(BuildContext context, Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Hero(
            tag: pelicula.heroId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                image: NetworkImage(pelicula.getPosterUrl()),
                height: 150.0,
              ),
            ),
          ),
          SizedBox(width: 20.0,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pelicula.title, style: Theme.of(context).textTheme.headline6, overflow: TextOverflow.ellipsis,),
                Text(pelicula.originalTitle, style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis),
                Row(
                  children: [
                    Icon(Icons.star),
                    Text(pelicula.voteAverage.toString(), style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis),
                  ]
                ),
              ],
            )
          ),
        ],
      )
    );
  }

  _crearCasting(Pelicula pelicula) {
    final peliculasProvider = PeliculasProvider();

    return FutureBuilder(
      future: peliculasProvider.getCast(pelicula.id.toString()),
      builder: (BuildContext context, AsyncSnapshot<List<Actor>> snapshot) {
        if (snapshot.hasData) {
          return _crearActoresPageView(snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _crearActoresPageView(List<Actor> actores) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: actores.length,
        itemBuilder: (context, indice) {
          return _crearTarjetaActor(actores[indice]);
        }
      ),
    );
  }

  _crearTarjetaActor(Actor actor) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/img/loading.gif'), 
              image: NetworkImage(actor.getFoto()),
              height: 150.0,
              fadeInDuration: Duration(milliseconds: 100),
              fit: BoxFit.cover,
            ),
          ),
          Text(
            actor.name,
            overflow: TextOverflow.ellipsis,
          )
        ],
      )
    );
  }
}
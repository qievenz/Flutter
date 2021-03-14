import 'package:app3_peliculas/src/models/pelicula_model.dart';
import 'package:app3_peliculas/src/providers/peliculas_provider.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate{

  final peliculas = ['batman', 
  'shazam',
  'shazam1',
  'shazam2',
  'shazam4',
  ];
  final peliculasRecientes = ['Capitan America', 'Spiderman'];

  final peliculasProvider = PeliculasProvider();
  
  @override
  List<Widget> buildActions(BuildContext context) {
      // Acciones del Appbar (limpiar, cancelar busqueda)
      return [
        IconButton(
          icon: Icon(Icons.clear), 
          onPressed: () => query = ''
        ),
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // Icono a la izquierda del appbar
      return IconButton(icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow, 
        progress: transitionAnimation), 
        onPressed: ()  => close(context, null)
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // Builder de los resultados que se muestran
      return Container();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // Sugerencias de busqueda

      if(query.isEmpty) return Container();

      return FutureBuilder(
        future: peliculasProvider.buscarPelicula(query),
        builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
          if (snapshot.hasData) {
            final peliculas = snapshot.data;
            return ListView(
              children: peliculas.map((pelicula) {
                return ListTile(
                  leading: FadeInImage(
                    image: NetworkImage(pelicula.getPosterUrl()),
                    placeholder: AssetImage('assets/img/loading.gif'),
                    width: 50.0,
                    fit: BoxFit.contain
                  ),
                  title: Text(pelicula.title),
                  subtitle: Text(pelicula.originalTitle),
                  onTap: () {
                    close(context, null);
                    pelicula.heroId = '${pelicula.id}-search';
                    Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                  },
                );
            }).toList());
          }
          return Center(child: CircularProgressIndicator());
        },
      );


/* build suggestion prueba
    final listaSugerida = (query.isEmpty) ? peliculasRecientes
                                          : peliculas.where((p) => p.toLowerCase().startsWith(query.toLowerCase())
    ).toList();

    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (BuildContext context, int index) { 
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listaSugerida[index]),
          onTap: () {
            print(listaSugerida[index]);
            showResults(context);
          },
        );
       },

    );
*/
  }
}
import 'dart:async';
import 'dart:convert';

import 'package:app3_peliculas/src/models/actor_model.dart';
import 'package:app3_peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apiKey = '253bdb699e116fa71d300265d797db26';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  int _paginaPopulares = 0;
  int _paginaEnCines = 0;
  bool _cargando = false;
  
  List<Pelicula> _populares = [];
  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
  }

  Future<dynamic> _getResponse (Uri url) async {
    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);

    return decodedData;
  }

  Future<List<Pelicula>> getEnCines() async {
    _paginaEnCines++;

    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': _paginaEnCines.toString()
    });

    final resp = await _getResponse(url);

    final peliculas = Peliculas.fromJsonList(resp['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getPopulares() async {
    if (_cargando) return [];

    _cargando = true;

    _paginaPopulares++;

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _paginaPopulares.toString()
    });

    final resp = await _getResponse(url);

    final peliculas = Peliculas.fromJsonList(resp['results']);
    
    _populares.addAll(peliculas.items);

    popularesSink(_populares);

    _cargando = false;

    return resp;
  }

  Future<List<Actor>> getCast(String id) async {
    final url = Uri.https(_url, '3/movie/$id/credits', {
      'api_key': _apiKey,
      'language': _language,
    });

    final resp = await _getResponse(url);

    final cast = Cast.fromJsonList(resp['cast']);

    return cast.actores;
  }

  Future<List<Pelicula>> buscarPelicula(String query) async {
    final url = Uri.https(_url, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'query': query
    });

    final resp = await _getResponse(url);

    final peliculas = Peliculas.fromJsonList(resp['results']);
    
    return peliculas.items;
  }
}
import 'dart:async';
import 'dart:convert';

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

  Future<List<Pelicula>> _getResponse (Uri url) async {
    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);

    final peliculas = Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    _paginaEnCines++;

    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': _paginaEnCines.toString()
    });

    return await _getResponse(url);
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
    
    _populares.addAll(resp);

    popularesSink(_populares);

    _cargando = false;

    return resp;
  }
}
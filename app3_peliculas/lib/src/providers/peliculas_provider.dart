import 'dart:convert';

import 'package:app3_peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apiKey = '253bdb699e116fa71d300265d797db26';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Pelicula>> _getResponse (String endpoint) async {
    final url = Uri.https(_url, '$endpoint', {
      'api_key': _apiKey,
      'language': _language,
    });

    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);

    final peliculas = Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() => _getResponse('3/movie/now_playing');

  Future<List<Pelicula>> getPopulares() => _getResponse('3/movie/popular');
}
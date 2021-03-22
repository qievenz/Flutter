import 'package:app9_noticias_provider/src/models/categoria_model.dart';
import 'package:app9_noticias_provider/src/models/noticias_models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class NoticiasService with ChangeNotifier {
  List<Article> headlines = [];
  String _categoriaSeleccionada = 'business';

  List<Categoria> categorias = [
    Categoria(Icons.build_outlined, 'business'),
    Categoria(Icons.movie, 'entertainment'),
    Categoria(Icons.gradient_rounded, 'general'),
    Categoria(Icons.healing, 'health'),
    Categoria(Icons.science, 'science'),
    Categoria(Icons.sports_basketball, 'sports'),
    Categoria(Icons.computer, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};
  
  NoticiasService(){
    this.getTopHeadlines();
    categorias.forEach((element) {
      this.categoryArticles[element.name] = [];
    }
    );
  }

  get categoriaSeleccionada => this._categoriaSeleccionada;
  set categoriaSeleccionada(String value) {
    this._categoriaSeleccionada = value;

    getTopHeadlinesByCategory(value);

    notifyListeners();
  }

  List<Article> get getArticuloCategoria => this.categoryArticles[this._categoriaSeleccionada]; 

  Uri _obtenerUri(String endpoint, String country, String categoria) {    
    return Uri.parse('https://newsapi.org/v2/${endpoint??'top-headlines'}?country=${country??'ar'}&category=${categoria??''}&apiKey=f93730b5985a4aacbfd004e0e1cfedda');
  }

  void getTopHeadlines() async {
    final uri = _obtenerUri('top-headlines', 'ar', '');

    final resp = await http.get(uri);

    if (resp.statusCode != 200 && resp.statusCode != 201) return;

    var noticiasResp = noticiasResponseFromJson(resp.body);

    this.headlines.addAll(noticiasResp.articles);

    notifyListeners();


  }
  
  getTopHeadlinesByCategory(String categoria) async {
    if (this.categoryArticles[categoria].length > 0) return this.categoryArticles[categoria];

    final uri = _obtenerUri('top-headlines', 'ar', categoria);

    final resp = await http.get(uri);

    if (resp.statusCode != 200 && resp.statusCode != 201) return;

    var noticiasResp = noticiasResponseFromJson(resp.body);

    this.categoryArticles[categoria].addAll(noticiasResp.articles);

    notifyListeners();

  }
}


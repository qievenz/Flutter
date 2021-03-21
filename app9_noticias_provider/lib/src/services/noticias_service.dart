import 'dart:convert';

import 'package:app9_noticias_provider/src/models/noticias_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class NoticiasService with ChangeNotifier {
  List<Article> headlines = [];

  

  NoticiasService(){
    this.getTopHeadlines();
  }

  Uri _obtenerUri(String endpoint, String country) {    
    return Uri.parse('https://newsapi.org/v2/${endpoint??'top-headlines'}?country=${country??'ar'}&apiKey=f93730b5985a4aacbfd004e0e1cfedda');
  }

  void getTopHeadlines() async {
    final uri = _obtenerUri('top-headlines', 'ar');

    final resp = await http.get(uri);

    if (resp.statusCode != 200 && resp.statusCode != 201) return;

    var noticiasResp = noticiasResponseFromJson(resp.body);

    this.headlines.addAll(noticiasResp.articles);

    notifyListeners();

  }

}


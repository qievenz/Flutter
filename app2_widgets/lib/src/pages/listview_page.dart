import 'dart:async';

import 'package:flutter/material.dart';

class ListviewPage extends StatefulWidget {
  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  List<int> _listaNumeros = [];
  int _ultimo = 1;

  ScrollController _scrollController = new ScrollController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_agregar10();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ]
      )
    );
  }

  _crearLista() {
    return RefreshIndicator(
      onRefresh: _obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (context, index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('data/assets/jar-loading.gif'), 
            image: NetworkImage('https://picsum.photos/500/300?image=$imagen'));
        },
      ),
    );
  }

  _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimo++;
      _listaNumeros.add(_ultimo);
    }

    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration  = new Duration(seconds: 2);


    new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 200), 
      curve: Curves.fastOutSlowIn
    );

    _agregar10();
  }

  _crearLoading() {
    if(_isLoading) {

      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment:  MainAxisAlignment.end,
        
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator()
            ],
          )
        ],
      );

    }
    else {
      return Container();
    }
  }

  Future<Null> _obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimo++;
      _agregar10();
    });

    return await Future.delayed(duration);
  }
}
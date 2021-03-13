import 'package:flutter/material.dart';

class ListviewPage extends StatefulWidget {
  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  List<int> _listaNumeros = [];
  int _ultimo = 1;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _agregar10();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: _crearLista(),
    );
  }

  _crearLista() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _listaNumeros.length,
      itemBuilder: (context, index) {
        final imagen = _listaNumeros[index];
        return FadeInImage(
          placeholder: AssetImage('data/assets/jar-loading.gif'), 
          image: NetworkImage('https://picsum.photos/500/300?image=$imagen'));
      },
    );
  }

  _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimo++;
      _listaNumeros.add(_ultimo);
    }

    setState(() {
      
    });
  }
}
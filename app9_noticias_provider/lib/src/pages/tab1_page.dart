import 'package:app9_noticias_provider/src/services/noticias_service.dart';
import 'package:app9_noticias_provider/src/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    final headLines = Provider.of<NoticiasService>(context).headlines;
    
    return Scaffold(
      body: (headLines.length == 0) 
        ? Center(child: CircularProgressIndicator(),)
        : ListaNoticias(headLines),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
import 'package:app9_noticias_provider/src/models/noticias_models.dart';
import 'package:app9_noticias_provider/src/theme/tema.dart';
import 'package:flutter/material.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (context, index) {
        return _Noticia(noticia: this.noticias[index], index: index,);
      }
    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticia({@required this.noticia, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(noticia: noticia),
        _TarjetaTitulo(noticia: noticia),
        _TarjetaImagen(noticia: noticia),
        _TarjetaBody(noticia: noticia),
        _TarjetaBotones(),
        SizedBox(height: 10,)
      ]
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: (){},
            fillColor: tema.accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_border, color: Colors.black87),
          ),
          SizedBox(width: 10),
          RawMaterialButton(
            onPressed: (){},
            fillColor: tema.accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.more_horiz, color: Colors.black87,),
          ),

        ],
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  const _TarjetaBody({Key key, this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text((noticia.description != null) ? noticia.description : ''),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen({Key key, this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: Container(
          child: (noticia.urlToImage != null)
          ? FadeInImage(
            placeholder: AssetImage('assets/img/giphy.gif'),
            image: NetworkImage(noticia.urlToImage),
          ) 
          : Image(image: AssetImage('assets/img/no-image.png'),
          ),
        ),
      ),
    );
  }
}



class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

  const _TarjetaTitulo({@required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(noticia.title, style: TextStyle(fontWeight: FontWeight.bold),),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;

  const _TarjetaTopBar({@required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Text('${noticia.source.name}.')
        ],
      )
      
    );
  }
}
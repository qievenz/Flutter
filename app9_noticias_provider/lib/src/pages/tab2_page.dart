import 'package:app9_noticias_provider/src/models/categoria_model.dart';
import 'package:app9_noticias_provider/src/services/noticias_service.dart';
import 'package:app9_noticias_provider/src/theme/tema.dart';
import 'package:app9_noticias_provider/src/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noticiasService = Provider.of<NoticiasService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _ListaCategorias(),

            Expanded(
              child: ListaNoticias(noticiasService.getArticuloCategoria),
            ),

          ],
        ),
      )
      
    );
  }
}

class _ListaCategorias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<NoticiasService>(context).categorias;

    return Container(
      width: double.infinity,
      height: 100,
      //color: Colors.red,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categorias.length,
        itemBuilder: (context, index) {
          return Container(
            width: 97,
            child: Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Column(
                children: [
                  _CategoriaBoton(categorias[index]),
                  //SizedBox(height: 5),
                  //Text(categorias[index].name),
                ],
              )
            ),
          );
        }
      ),
    );
  }
}

class _CategoriaBoton extends StatelessWidget {
  final Categoria categoria;

  const _CategoriaBoton(this.categoria);

  @override
  Widget build(BuildContext context) {
    final noticiasService = Provider.of<NoticiasService>(context);

    return GestureDetector(
      onTap: () {
        final noticiasService = Provider.of<NoticiasService>(context, listen: false);
        noticiasService.categoriaSeleccionada = categoria.name;
      },
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          categoria.icon,
          color: (noticiasService.categoriaSeleccionada == categoria.name) 
            ? tema.accentColor
            : Colors.black45,
          size: 50.0,
        )
      ),
    );
  }
}
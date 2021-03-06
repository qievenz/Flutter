import 'package:app7_patron_bloc_validacion_formularios/bloc/productos_bloc.dart';
import 'package:app7_patron_bloc_validacion_formularios/bloc/provider.dart';
import 'package:app7_patron_bloc_validacion_formularios/models/producto_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    final productosBloc = Provider.productosBloc(context);
    productosBloc.cargarProductos();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete), 
            onPressed: () => _borrarTodo(productosBloc),
          ),
        ],
      ),
      body: _crearListado(productosBloc),
      floatingActionButton: _crearBoton(context),
    );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'producto')
        .then((value) => setState((){})),
    );
  }

  _crearListado(ProductosBloc productosBloc) {
    return StreamBuilder(
      stream: productosBloc.productosStream,
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot){
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) { 
                final producto = snapshot.data[index];
                
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (direccion) {
                    productosBloc.borrarProducto(producto.id);
                  },
                  child: ListTile(

                    title: Text('${producto.titulo} - ${producto.valor}'),
                    subtitle: Text(producto.id),
                    onTap: () => Navigator.pushNamed(context, 'producto', arguments: producto)
                      .then((value) => setState((){})),

                  ),
                );
              }
          );
        } else {
          return Center (
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }

  _borrarTodo(ProductosBloc productosBloc) {
    productosBloc.borrarTodosProducto();
    setState(() {});
  }

}
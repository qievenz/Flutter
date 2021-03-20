import 'dart:io';

import 'package:app7_patron_bloc_validacion_formularios/models/producto_model.dart';
import 'package:app7_patron_bloc_validacion_formularios/src/providers/productos_provider.dart';
import 'package:app7_patron_bloc_validacion_formularios/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final productoProvider = ProductosProvider();

  ProductoModel producto = ProductoModel();
  bool _guardando = false;
  File foto;


  @override
  Widget build(BuildContext context) {
    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;

    if (prodData != null) producto = prodData;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Producto'),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.photo_size_select_actual), 
            onPressed: () {_elegirFoto(ImageSource.gallery);}
          ),
          IconButton(
            icon: Icon(Icons.camera_alt), 
            onPressed: () {_elegirFoto(ImageSource.camera);}
          ),
        ],
      ),  
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                _mostrarFoto(),
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                _crearBoton(),
              ],
            ),
          ),
        )
      ),   
    );
  }

  _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
      validator: (value) => value.length < 3 ? 'Ingrese nombre' : null,
      onSaved: (newValue) => producto.titulo = newValue,
    );
  }

  _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio'
      ),
      validator: (value) => !isNumeric(value) ? 'Ingrese un precio valido': null,
      onSaved: (newValue) => producto.valor = double.parse(newValue),
      
    );
  }

  _crearBoton() {
    return ElevatedButton(
      onPressed: (_guardando) ? null : _submit,
      child: Text('Guardar'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)
        ),
        elevation: 0.0,
        primary: Colors.deepPurple,
        textStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  _crearDisponible() {
    return SwitchListTile(
      value: producto.disponible, 
      title: Text('Disponible'),
      onChanged: (value) => setState(() => producto.disponible = value),
    );
  }

  _submit() async {
    if (!formkey.currentState.validate()) return;

    formkey.currentState.save();
    
    setState(() => _guardando = true);

    if (foto != null) producto.fotoUrl = await productoProvider.subirImagen(foto);

    if (producto.id == null) {
      productoProvider.crearProducto(producto);
    } else {
      productoProvider.actualizarProducto(producto);
    }

    setState(() => _guardando = false);
    mostrarSnackBar('Registro guardado');

    Navigator.pop(context);
  }


  void mostrarSnackBar(String mensaje) {
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );

    ScaffoldMessenger.of(scaffoldKey.currentContext).showSnackBar(snackbar);
  }

  _mostrarFoto() {
    if (producto.fotoUrl != null) {
      return FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'), 
        image: NetworkImage(producto.fotoUrl),
        height: 300.0,
        fit: BoxFit.cover
      );
    } else { 
      return (foto == null) ? Image(
        image: AssetImage('assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover
      ) : Image.file(
        foto,
        height: 300.0,
        fit: BoxFit.cover
      );
    }
  }

  void _elegirFoto(ImageSource source) async {
    final _picker = ImagePicker();
    final pickedFile = await _picker.getImage(
      source: source,
    );
    foto = File(pickedFile.path);
    if (foto != null) {
      producto.fotoUrl = null;
    }
    setState(() {});
  }
}
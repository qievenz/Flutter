import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:app7_patron_bloc_validacion_formularios/models/producto_model.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

class ProductosProvider {
  final String _url = 'flutter-varios-44f7e-default-rtdb.firebaseio.com';

  Future<bool> crearProducto (ProductoModel producto) async {
    final url = Uri.https(_url, 'productos.json');

    final resp = await http.post(url, body: productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<ProductoModel>> cargarProductos() async {
    final url = Uri.https(_url, 'productos.json');

    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);

    if (decodedData == null) return [];

    final List<ProductoModel> productos = [];
    decodedData.forEach((key, value) {
      final prodTemp = ProductoModel.fromJson(value);
      prodTemp.id = key;
      productos.add(prodTemp);
    });

    return productos;
  }

  borrarProducto(String id) async {
    final url = Uri.https(_url, 'productos/$id.json');

    final resp = await http.delete(url);

    return resp;
  }

  borrarTodo() async {
    final url = Uri.https(_url, 'productos.json');

    final resp = await http.delete(url);

    return resp;
  }

  actualizarProducto(ProductoModel producto) async {
    final url = Uri.https(_url, 'productos/${producto.id}.json');

    final resp = await http.put(url, body: productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<String> subirImagen(File imagen) async {
    final url = Uri.parse('url del endpoint');
    final mimeType = mime(imagen.path).split('/');

    final request = http.MultipartRequest(
      'POST',
      url
    );

    final file = await http.MultipartFile.fromPath(
      'file', 
      imagen.path,
      contentType: MediaType(mimeType[0], mimeType[1])
    );

    request.files.add(file);

    final streamResp = await request.send();

    final resp = await http.Response.fromStream(streamResp);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('Algo salio maal');
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);

    return respData['secure_url'];

  }
}
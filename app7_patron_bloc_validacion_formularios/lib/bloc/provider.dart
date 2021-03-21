import 'package:app7_patron_bloc_validacion_formularios/bloc/login_bloc.dart';
import 'package:app7_patron_bloc_validacion_formularios/bloc/productos_bloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget{
  final loginBloc = LoginBloc();
  final _productosBloc = ProductosBloc();

  static Provider _instancia;

  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = Provider._internal(key: key, child: child);
    }

    return _instancia;
  }

  Provider._internal({Key key, Widget child})
    : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
  static ProductosBloc productosBloc (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._productosBloc;
  }
}
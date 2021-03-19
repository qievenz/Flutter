import 'dart:async';

import 'package:app7_patron_bloc_validacion_formularios/bloc/validators.dart';
export 'package:app7_patron_bloc_validacion_formularios/bloc/login_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Validators{
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Recuperar los datos del stream
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  Stream<bool> get botonStream => Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  
  // Insertar valores al Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }

}
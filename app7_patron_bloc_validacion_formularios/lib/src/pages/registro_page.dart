import 'dart:ui';
import 'package:app7_patron_bloc_validacion_formularios/bloc/login_bloc.dart';
import 'package:app7_patron_bloc_validacion_formularios/bloc/provider.dart';
import 'package:app7_patron_bloc_validacion_formularios/src/providers/usuario_provider.dart';
import 'package:app7_patron_bloc_validacion_formularios/src/utils/utils.dart';
import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  final usuarioProvider = UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
  }

  _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0),
          ]
        )
      ),
    );

    final circulo = Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );

    return Stack(
      children: [
        fondoMorado,
        Positioned(child: circulo, top: 90.0, left: 30.0,),
        Positioned(child: circulo, top: -40.0, left: -50.0,),
        Positioned(child: circulo, bottom: -90.0, right: -10.0,),
        Positioned(child: circulo, bottom: 120.0, right: 20.0,),
        Positioned(child: circulo, bottom: -50.0, left: 20.0,),
        Container(
          padding: EdgeInsets.only(top: 70.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0,),
              SizedBox(width: double.infinity, height: 10.0,),
              Text('Ivan', style: TextStyle(color: Colors.white, fontSize: 25.0),)
            ],
          ),
        )
      ],
    );
  }

  _loginForm(BuildContext context) {
    final bloc = Provider.of(context);

    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(child: Container(height: 230.0,)),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Text('Crear Cuenta', style: TextStyle(fontSize: 20.0),),
                SizedBox(height: 60.0,),
                _crearEmail(bloc),
                SizedBox(height: 40.0,),
                _crearPassword(bloc),
                SizedBox(height: 40.0,),
                _crearBoton(bloc),
              ],
            ),
          ),

          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, 'registro'), 
            child: Text('Crear una cuenta')
          ),

          SizedBox(height: 100.0,)
        ],
      ),
    );
  }

  _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream ,
      //initialData: initialData ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email, color: Colors.deepPurple,),
              hintText: 'ejemp??o@corre.com',
              labelText: 'Corre electronico',
              counterText: snapshot.data,
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }
  
  _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.lock_outline, color: Colors.deepPurple,),
              labelText: 'Password',
              counterText: snapshot.data,
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  _crearBoton(LoginBloc bloc){
    return StreamBuilder(
      stream: bloc.botonStream,
      builder: (context, snapshot) {
        return ElevatedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
            ),
            elevation: 0.0,
            primary: Colors.deepPurple,
            textStyle: TextStyle(color: Colors.white),
          ),
          onPressed: snapshot.hasData ? () => _register(context, bloc) : null,
        );
      }
    );
  }

  _register(BuildContext context, LoginBloc bloc) async{
    final loginResp = await usuarioProvider.nuevoUsuario(bloc.email, bloc.password);

    if (loginResp['ok']) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      mostrarAlerta(context);
    }
  }
}
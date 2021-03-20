import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();
  
    factory PreferenciasUsuario() {
      return _instancia;
    }
 
    SharedPreferences _prefs;
  
    PreferenciasUsuario._internal();

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }
  
  get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'login';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}
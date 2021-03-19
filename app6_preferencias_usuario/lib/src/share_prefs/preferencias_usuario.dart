import 'package:app6_preferencias_usuario/src/pages/home_page.dart';
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
  
  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }
  
  get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? HomePage.routeName;
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}
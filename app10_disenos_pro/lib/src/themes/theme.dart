import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  bool _darkTheme = false;
  bool get darkTheme => this._darkTheme;
  set darkTheme(bool value) {
    this._darkTheme = value;
    this._customTheme = false;
    notifyListeners();
  }

  bool _customTheme = false;
  bool get customTheme => this._customTheme;
  set customTheme(bool value) {
    this._customTheme = value;
    this._darkTheme = false;
    notifyListeners();
  }

  ThemeData _currentTheme;
  ThemeData get currentTheme => this._currentTheme;
  set currentTheme(ThemeData value) {
    this._currentTheme = value;
    notifyListeners();
  }
}
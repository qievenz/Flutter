import 'package:flutter/material.dart';

class UiService extends ChangeNotifier{
  int _selectedMenuOption = 0;

  int get selectedMenuOption {
    return this._selectedMenuOption;
  }

  set selectedMenuOption (int i) {
    this._selectedMenuOption = i;

    notifyListeners();
  }
}
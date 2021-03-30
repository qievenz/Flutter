import 'package:app10_disenos_pro/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier{
  Widget _currentPage = SlideShowPage();

  set currentPage (Widget page) {
    this._currentPage = page;
    notifyListeners();
  }
  Widget get currentPage => this._currentPage;
}
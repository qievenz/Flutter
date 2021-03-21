import 'package:app9_noticias_provider/src/pages/tab1_page.dart';
import 'package:app9_noticias_provider/src/services/noticias_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  static final route = 'tabs';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _NavegacionModel(),
      child: Scaffold(
        body: _paginas(),
        bottomNavigationBar: _navegacion(),
      ),
    );
  }
}

class _navegacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (value) => navegacionModel.paginaActual = value,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Para ti'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Encabezados'
        ),
      ],
    );
  }
}

class _paginas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: navegacionModel.pageController,
      children: [
        Tab1Page(),
        Container(
          color: Colors.blue,
        ),
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  int get paginaActual => this._paginaActual;
  PageController _pageController = PageController();
  
  set paginaActual(int value) {
    this._paginaActual = value;
    _pageController.animateToPage(value, duration: Duration(milliseconds: 350), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
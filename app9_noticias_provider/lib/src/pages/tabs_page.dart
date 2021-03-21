import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  static final route = 'tabs';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas(),
      bottomNavigationBar: _navegacion(),
    );
  }
}

class _navegacion extends StatelessWidget {
  const _navegacion({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
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
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.blue,
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';

import 'src/pages/tabs_page.dart';
import 'src/theme/tema.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noticias',
      theme: tema,
      initialRoute: TabsPage.route,
      routes: {
        TabsPage.route: (context) => TabsPage(),
      },
    );
  }
}
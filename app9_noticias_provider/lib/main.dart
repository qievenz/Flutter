import 'package:app9_noticias_provider/src/services/noticias_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/pages/tabs_page.dart';
import 'src/theme/tema.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NoticiasService()
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Noticias',
        theme: tema,
        initialRoute: TabsPage.route,
        routes: {
          TabsPage.route: (context) => TabsPage(),
        },
      ),
    );
  }
}
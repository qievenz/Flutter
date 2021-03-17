import 'package:app5_qr_scanner/providers/ui_provider.dart';
import 'package:app5_qr_scanner/src/pages/home_page.dart';
import 'package:app5_qr_scanner/src/pages/mapa_page.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider())
      ],
      child: MaterialApp(
        title: 'QR Scanner',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'mapa': (_) => MapaPage(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.deepPurpleAccent,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.greenAccent
          ),
        ),
      ),
    );
  }
}
import 'package:app11_bandnames/pages/status_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'services/socket_serivce.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SocketService()),
      ],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: StatusPage.route,
        routes: {
          HomePage.route: (context) => HomePage(),
          StatusPage.route: (context) => StatusPage()
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

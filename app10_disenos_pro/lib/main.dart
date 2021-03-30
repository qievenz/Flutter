import 'package:app10_disenos_pro/src/pages/sliver_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/pages/emergency_page.dart';
import 'src/pages/launcher_page.dart';
import 'src/pages/navegacion_page.dart';
import 'src/themes/theme.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => ThemeChanger(2),
    child: MyApp(),
  )
);
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeChanger>(context).darkTheme ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title: 'Diseños PRO',
      home: LauncherPage(),
    );
  }
}

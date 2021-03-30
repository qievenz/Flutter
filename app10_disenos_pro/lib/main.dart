import 'package:app10_disenos_pro/src/pages/launcher_tablet_page.dart';
import 'package:app10_disenos_pro/src/pages/sliver_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/models/layout_model.dart';
import 'src/pages/emergency_page.dart';
import 'src/pages/launcher_page.dart';
import 'src/pages/navegacion_page.dart';
import 'src/themes/theme.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger(2)),
      ChangeNotifierProvider<LayoutModel>(create: (_) => new LayoutModel()),
    ],
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
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          // return Container(
          //   child: LauncherPage(),
          // );

          final screenSize = MediaQuery.of(context).size;

          if ( screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
        },
      )
    );
  }
}

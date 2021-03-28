import 'package:app10_disenos_pro/src/pages/sliver_list_page.dart';
import 'package:flutter/material.dart';

import 'src/pages/emergency_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños PRO',
      home: SliverListPage(),
    );
  }
}

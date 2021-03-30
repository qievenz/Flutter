import 'package:app10_disenos_pro/src/themes/theme.dart';
import 'package:app10_disenos_pro/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: PinterestMenu(),
      body: ChangeNotifierProvider(
        create: (context) => _MenuModel(),
          child: Stack(
          children: [
            PinterestGrid(),
            _BottomPinterestMenu(),
          ]
        ,),
      )
   );
  }
}

class _BottomPinterestMenu extends StatelessWidget {
  const _BottomPinterestMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context).currentTheme;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: PinterestMenu(
          mostrar: mostrar,
          width: 300,
          backgroundColor: themeProvider.scaffoldBackgroundColor,
          activeColor: themeProvider.accentColor,
          //inactiveColor: Colors.black87, 
          items: [
            PinterestButton(icon: Icons.pie_chart, onPressed: () {print('icon');}),
            PinterestButton(icon: Icons.search, onPressed: () {print('search');}),
            PinterestButton(icon: Icons.notifications, onPressed: () {print('notifications');}),
            PinterestButton(icon: Icons.supervised_user_circle, onPressed: () {print('supervised_user_circle');}),
          ],
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (i) => i);
  ScrollController controller = ScrollController();

  @override
  void initState() {
    double scrollOffsetAnterior = 0;
    
    controller.addListener(() {  
      if (controller.offset > scrollOffsetAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollOffsetAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem({
    Key key, this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context).currentTheme;

    return new Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: themeProvider.accentColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: themeProvider.backgroundColor,
          child: new Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => this._mostrar;
  set mostrar(bool value) {
    this._mostrar = value;
    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}
class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;
  final double width;
  final double height;

  PinterestMenu({
    @required this.items,
    this.mostrar = true, 
    this.backgroundColor = Colors.white, 
    this.activeColor = Colors.black45, 
    this.inactiveColor = Colors.blueGrey, 
    this.width = 250, 
    this.height = 60,
  });

  

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      builder: (context, child) {
        Provider.of<_MenuModel>(context, listen: false).backgroundColor = this.backgroundColor;
        Provider.of<_MenuModel>(context, listen: false).activeColor = this.activeColor;
        Provider.of<_MenuModel>(context, listen: false).inactiveColor = this.inactiveColor;
        
        return AnimatedOpacity(
          opacity: (mostrar) ? 1 : 0,
          duration: Duration(milliseconds: 250),
          child: _PinterestMenuBackground(
            width: width,
            height: height,
            child: _MenuItems(items),
          ),
        );
      },
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {

  final Widget child;
  final double width;
  final double height;
  
  const _PinterestMenuBackground({
    @required this.child, 
    @required this.width, 
    @required this.height});

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<_MenuModel>(context);

    return Container(
      child: child,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: menuProvider.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            offset: Offset(10,10),
            blurRadius: 10,
            spreadRadius: -5,
          )
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: 
        List.generate(menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton(this.index, this.item);
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<_MenuModel>(context);
    Color color;
    double tamano;

    if (menuProvider.itemSeleccionado == index) {
      color = menuProvider.activeColor;
      tamano = 35.0;
    } else {
      color = menuProvider.inactiveColor;
      tamano = 25.0;
    }

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon, 
          size: tamano, 
          color: color,
        ),
      ),
    );
  }
}

//Provider
class _MenuModel with ChangeNotifier{
  int _itemSeleccionado = 0;
  int get itemSeleccionado => this._itemSeleccionado;
  set itemSeleccionado(int value) {
    this._itemSeleccionado = value;
    notifyListeners();
  }
  
  Color _backgroundColor;
  Color get backgroundColor => this._backgroundColor;
  set backgroundColor(Color value) => this._backgroundColor = value;

  Color _inactiveColor;
  Color get inactiveColor => this._inactiveColor;
  set inactiveColor(Color value) => this._inactiveColor = value;

  Color _activeColor;
  Color get activeColor => this._activeColor;
  set activeColor(Color value) => this._activeColor = value;

}
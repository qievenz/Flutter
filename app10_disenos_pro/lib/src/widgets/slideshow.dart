import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SlideShow extends StatelessWidget {
  @required final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPuntoSecundario;
  final Color colorPuntoPrimario;
  final double bulletPrimario;
  final double bulletSecundario;

  const SlideShow({
    Key key, 
    this.slides,
    this.puntosArriba = false, 
    this.colorPuntoSecundario = Colors.grey, 
    this.colorPuntoPrimario = Colors.blue, 
    this.bulletPrimario = 12.0, 
    this.bulletSecundario = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _SliderModel(),
      child: SafeArea(
        child: Center(
            child: Builder(
              builder: (BuildContext context) {
                Provider.of<_SliderModel>(context).colorPrimario = this.colorPuntoPrimario;
                Provider.of<_SliderModel>(context).colorSecundario = this.colorPuntoSecundario;
                Provider.of<_SliderModel>(context).bulletPrimario = this.bulletPrimario;
                Provider.of<_SliderModel>(context).bulletSecundario = this.bulletSecundario;
                return _EstructuraSlideshow(puntosArriba: puntosArriba, slides: slides);
              },
            ),
         ),
      ),
    );
  }
}

class _EstructuraSlideshow extends StatelessWidget {
  const _EstructuraSlideshow({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.puntosArriba) 
          _Dots(this.slides.length,),
        Expanded(child: _Slides(this.slides)),
        if (!this.puntosArriba) 
          _Dots(this.slides.length,),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  @required final int cantidad;

  const _Dots(
    this.cantidad, 
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(cantidad, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  
  const _Dot(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    final slideShowModel = Provider.of<_SliderModel>(context);
    double tamano;
    Color color;
    
    if (slideShowModel.currentPage >= index - 0.5 && slideShowModel.currentPage < index + 0.5) {
      color = slideShowModel.colorPrimario;
      tamano = slideShowModel.bulletPrimario;
    } else {
      color = slideShowModel.colorSecundario;
      tamano = slideShowModel.bulletSecundario;
    }

    return AnimatedContainer(
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ), 
      duration: Duration(milliseconds: 200),
    );
  }
}

class _Slides extends StatefulWidget {
  @required final List<Widget> slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    
    pageViewController.addListener(() {
      Provider.of<_SliderModel>(context, listen: false).currentPage = pageViewController.page;
    });
  }
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        // children: [
        //   _Slide(svg: 'assets/svgs/slide-1.svg'),
        //   _Slide(svg: 'assets/svgs/slide-2.svg'),
        //   _Slide(svg: 'assets/svgs/slide-3.svg'),
        // ],
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  @required final Widget slide;
  
  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

//Provider
class _SliderModel with ChangeNotifier{
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;
  set currentPage(double value) {
    this._currentPage = value;
    notifyListeners();
  } 

  Color get colorPrimario => this._colorPrimario;
  set colorPrimario(Color value) {
    this._colorPrimario = value;
  }

  Color get colorSecundario => this._colorSecundario;
  set colorSecundario(Color value) {
    this._colorSecundario = value;
  }

  double get bulletPrimario => this._bulletPrimario;
  set bulletPrimario(double value) {
    this._bulletPrimario = value;
  }

  double get bulletSecundario => this._bulletSecundario;
  set bulletSecundario(double value) {
    this._bulletSecundario = value;
  }
}
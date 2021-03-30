import 'package:app10_disenos_pro/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SlideShowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var children = [
      Expanded(child: _SlideShow()),
      Expanded(child: _SlideShow()),
    ];

    final isLarge = (MediaQuery.of(context).size.width > 500) ? true : false;

    return Scaffold(
      body: (isLarge)
        ? Row(children: children,)
        : Column(children: children,),
   );
  }
}

class _SlideShow extends StatelessWidget {
  const _SlideShow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideShow(
      colorPuntoPrimario: Colors.purple,
      colorPuntoSecundario: Colors.red.shade200,
      bulletPrimario: 20,
      bulletSecundario: 12,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
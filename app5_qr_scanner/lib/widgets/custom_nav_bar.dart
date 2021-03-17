import 'package:app5_qr_scanner/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiService = Provider.of<UiService>(context);
    final currentIndex = uiService.selectedMenuOption;

    return BottomNavigationBar(
      onTap: (int i) => uiService.selectedMenuOption = i,
      elevation: 0,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'Direcciones'
        ),
      ],
      
    );
  }
}
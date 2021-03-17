import 'package:app5_qr_scanner/providers/ui_provider.dart';
import 'package:app5_qr_scanner/src/pages/direcciones_page.dart';
import 'package:app5_qr_scanner/src/pages/mapas_page.dart';
import 'package:app5_qr_scanner/widgets/scan_button.dart';
import 'package:app5_qr_scanner/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever), 
            onPressed: () {}
          ),
        ],
        elevation: 0,
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiService = Provider.of<UiService>(context);
    
    final currentIndex = uiService.selectedMenuOption;

    switch (currentIndex) {
      case 0:
          return MapasPage();
        break;
      case 1:
        return DireccionesPage();
        break;
      default:
        return MapasPage();
    }
  }
}
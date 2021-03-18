import 'package:app5_qr_scanner/providers/db_provider.dart';
import 'package:app5_qr_scanner/providers/scan_list_provider.dart';
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
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever), 
            onPressed: () => scanListProvider.borrarTodos(),
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

    final uiService = Provider.of<UiProvider>(context);
    
    final currentIndex = uiService.selectedMenuOption;

    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);


    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansTipo('geo');
        return MapasPage();
        break;
      case 1:
        scanListProvider.cargarScansTipo('http');
        return DireccionesPage();
        break;
      default:
        return MapasPage();
    }
  }
}
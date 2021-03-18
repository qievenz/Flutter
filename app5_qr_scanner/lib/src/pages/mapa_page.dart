import 'package:app5_qr_scanner/models/scan_model.dart';
import 'package:flutter/material.dart';

class MapaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      body: Text(scan.valor),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        //FlutterBarcodeScanner.getBarcodeStreamReceiver("#3d8bef", "Cancelar", false, ScanMode.QR).listen((qrResp) => _procesarQR());
        var qrResp = 'pagina.com';
        _procesarQR(qrResp);
      },
      child: Icon(Icons.filter_center_focus),
    );
  }

  _procesarQR(qrResp) {

  }
}
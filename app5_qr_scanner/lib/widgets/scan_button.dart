import 'package:app5_qr_scanner/providers/scan_list_provider.dart';
import 'package:app5_qr_scanner/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String qrResp = await FlutterBarcodeScanner.scanBarcode("#3d8bef", "Cancelar", false, ScanMode.QR);

        if (qrResp == '-1') return;

        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(qrResp);

        launchURL(context, nuevoScan);
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}
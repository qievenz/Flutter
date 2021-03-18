import 'package:app5_qr_scanner/providers/scan_list_provider.dart';
import 'package:app5_qr_scanner/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        //FlutterBarcodeScanner.getBarcodeStreamReceiver("#3d8bef", "Cancelar", false, ScanMode.QR).listen((qrResp) => _procesarQR());
        //var qrResp = 'http:www.xvideos.com';
        var qrResp = 'gps:-34.658264,-58.564609';
        
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(qrResp);

        launchURL(context, nuevoScan);
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}
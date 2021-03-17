import 'package:app5_qr_scanner/models/scan_model.dart';
import 'package:app5_qr_scanner/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        //FlutterBarcodeScanner.getBarcodeStreamReceiver("#3d8bef", "Cancelar", false, ScanMode.QR).listen((qrResp) => _procesarQR());
        var qrResp = 'pagina.com.ar';
        _procesarQR(qrResp);
      },
      child: Icon(Icons.filter_center_focus),
    );
  }

  _procesarQR(qrResp) async {

    ScanModel test = ScanModel(id: 2, tipo: 'qwert', valor: qrResp);

    //DBPRovider.db.nuevoScan(test);
    var scan = await DBPRovider.db.obtenerScan(2);
    print(scan.valor);
  }
}
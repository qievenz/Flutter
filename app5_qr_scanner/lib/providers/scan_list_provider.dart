import 'package:app5_qr_scanner/models/scan_model.dart';
import 'package:app5_qr_scanner/providers/db_provider.dart';
import 'package:flutter/material.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBPRovider.db.nuevoScan(nuevoScan);

    nuevoScan.id = id;

    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);
      notifyListeners();
    }
    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBPRovider.db.obtenerScansTodos();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScansTipo(String tipo) async {
    final scans = await DBPRovider.db.obtenerScansTipo(tipo);
    this.scans = [...scans];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBPRovider.db.borrarTodosScans();
    this.scans = [];
    notifyListeners();
  }

  borrarScanPor(int id) async {
    await DBPRovider.db.borrarScan(id);
    this.cargarScansTipo(this.tipoSeleccionado);
  }

}
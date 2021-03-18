import 'package:app5_qr_scanner/models/scan_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context, ScanModel scan) async {
  if (scan.tipo == 'http'){
    await canLaunch(scan.valor) ? await launch(scan.valor) : throw 'Could not launch ${scan.valor}';
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
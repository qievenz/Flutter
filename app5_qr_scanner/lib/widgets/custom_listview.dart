import 'package:app5_qr_scanner/providers/scan_list_provider.dart';
import 'package:app5_qr_scanner/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomListView extends StatelessWidget {

  final IconData leadIcon;

  const CustomListView({@required this.leadIcon});
  
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        onDismissed: (DismissDirection disdir) =>Provider.of<ScanListProvider>(context, listen: false).borrarScanPor(scans[i].id),
        child: ListTile(
          leading: Icon(leadIcon, color: Theme.of(context).primaryColor),
          title: Text(scans[i].valor),
          subtitle: Text('ID: ${scans[i].id}'),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => launchURL(context, scans[i]),
        ),
      )
    );
  }
}
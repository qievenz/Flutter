import 'package:app11_bandnames/services/socket_serivce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  static final String route = 'status_page';

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('status: ${socketService.serverStatus}'),
          ],
        ),
      ),
    );
  }
}

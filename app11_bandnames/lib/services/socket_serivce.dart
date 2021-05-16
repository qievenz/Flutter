import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connectig }

class SocketService with ChangeNotifier {
  var _serverStatus = ServerStatus.Connectig;

  get serverStatus => this._serverStatus;

  SocketService() {
    this._initConfig();
  }
  void _initConfig() {
    print('configurando socket');

    IO.Socket socket = IO.io('http://127.0.0.1:4000', {
      'transports': ['websocket'],
      'autoConnect': true
    });

    socket.onConnect((_) {
      print('connect');
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    socket.onDisconnect((_) {
      print('disconnect');
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    socket.on('nuevo-mensaje', (payload) {
      print('nuevo-mensaje: $payload');
    });
  }
}

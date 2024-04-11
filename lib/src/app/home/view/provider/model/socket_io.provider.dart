import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketIOProvider extends ChangeNotifier {
  late IO.Socket socket;

  SocketIOProvider() {
    _initSocket();
  }

  _initSocket() {
    socket = IO.io("http://3.145.56.143:3001", <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });

    if (!socket.connected) {
      socket.connect();
    }
  }

  void emitEvent(dynamic data) {
    socket.emit('client_to_server', data);
  }

  get isConnected => socket.connected;

  IO.Socket get connection => socket;

  @override
  void dispose() {
    socket.dispose();
    super.dispose();
  }
}

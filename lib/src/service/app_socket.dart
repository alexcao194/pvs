import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart' as IO;
class AppSocket {
  AppSocket._();
  static IO.Socket? _socket;
  static String localHost = 'http://192.168.12.106:1904';

  static IO.Socket? get instance {
    if (_socket == null) {
      initial();
    }
    return _socket;
  }

  static void initial() {
    _socket = IO.io(localHost,
        IO.OptionBuilder().setTransports(['websocket']).build());
  }

  static void addListener(StreamSocket streamSocket, String key) {
    _socket?.on(key, (data) => streamSocket.addResponse);
  }
}

class StreamSocket{
  final _socketResponse= StreamController<String>();
  void Function(String) get addResponse => _socketResponse.sink.add;
  Stream<String> get getResponse => _socketResponse.stream;
  void dispose(){
    _socketResponse.close();
  }
}

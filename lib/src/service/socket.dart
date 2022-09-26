import 'package:socket_io_client/socket_io_client.dart' as IO;
class Socket {
  Socket._();

  static IO.Socket? _socket;

  static IO.Socket? get instance {
    if (_socket == null) {
      final cacheSocket = IO.io('http://192.168.0.123:1904',
          IO.OptionBuilder().setTransports(['websocket']).build());
      _socket = cacheSocket;
    }
    return _socket;
  }
}

import 'package:socket_io_client/socket_io_client.dart' as IO;

class Socket {
  const Socket._();
  static IO.Socket? _socket;

  static IO.Socket? get instance {
    _socket ??= IO.io(
        'http://localhost:1904',
        IO.OptionBuilder()
          .setTransports(['websocket'])
          .build()
      );
    return _socket;
  }
}
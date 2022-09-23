import 'package:socket_io_client/socket_io_client.dart' as IO;

class AppSocket {
  const AppSocket._();
  static IO.Socket? socket;

  static get instance {
    socket ??= IO.io(
        'http://localhost:1904',
        IO.OptionBuilder()
          .setTransports(['websocket'])
          .build()
      );
    return socket;
  }
}
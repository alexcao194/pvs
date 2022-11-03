import 'dart:async';

import 'package:pvs/src/service/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:socket_io_client/socket_io_client.dart';

class StreamSocket {

  static io.Socket? socket;
  static final  _response = StreamController<List<Map<String, String>>>();

  static init() {
    socket = io.io('http://${Prefs.get('ip4')}', OptionBuilder().setTransports(['websocket']).build());
    socket!.onDisconnect((_) => print('disconnect'));
  }

  static Stream<List<Map<String, String>>>? get getResponse => _response.stream;
  static Function(List<Map<String, String>>) get addResponse => _response.sink.add;
  
}
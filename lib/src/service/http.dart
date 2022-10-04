import 'package:http/http.dart' as http;
import 'package:pvs/src/service/app_network_infor.dart';
import 'package:pvs/src/service/app_socket.dart';

class HTTP {
  static String ip4 = '';
  static Future<String> get(String address, Map<String, String> request) async {
    await AppNetworkInfo.wifiIp4.then((value) {
      ip4 = value!;
    });
    var url = Uri.http(ip4, address, request);
    var response = await http.get(url);
    return response.body;
  }

  static Future<String> post(String address, Map<String, String> request) async {
    await AppNetworkInfo.wifiIp4.then((value) {
      ip4 = value!;
    });
    var url = Uri.http(ip4, address, request);
    var response = await http.post(url);
    return response.body;
  }
}



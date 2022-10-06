import 'package:http/http.dart' as http;
import 'package:pvs/src/service/app_network_infor.dart';

class HTTP {
  static Future<String> get(String address, Map<String, String> request) async {
    var url = Uri.http(AppNetworkInfo.IP4!, address, request);
    var response = await http.get(url);
    return response.body;
  }

  static Future<String> post(String address, Map<String, String> request) async {
    var url = Uri.http(AppNetworkInfo.IP4!, address, request);
    var response = await http.post(url);
    return response.body;
  }
}



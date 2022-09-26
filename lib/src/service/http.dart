import 'package:http/http.dart' as http;

class HTTP {
  static Future<String> get(String address, Map<String, String> request) async {
    var url = Uri.http('192.168.12.106:1904', address, request);
    var response = await http.get(url);
    return response.body;
  }
}



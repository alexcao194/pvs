import 'package:http/http.dart' as http;

class HTTP {
  static Future<String> get(String url, Map<String, String> request) async {
    var url = Uri.http('192.168.0.123:1904', 'login', request);
    var response = await http.get(url);
    return response.body;
  }
}



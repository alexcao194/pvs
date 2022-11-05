import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:pvs/src/service/shared_preferences.dart';

class DataHandler {
  static Future<Map<String, dynamic>?> getQuestion(String lesson) async {
    Response res = await http.get(
        Uri.http('${Prefs.get('ip4')}', '/question', {'lesson': lesson}),
      headers: {
          'x-access-token' : Prefs.get('token')
      }
    );
    return json.decode(res.body);
  }

  static Future<String> getRsult() async {
    Response res = await http.get(
      Uri.parse('${Prefs.get('ip4')}'),
      headers: {
        'x-access-token' : Prefs.get('token')
      }
    );
    return res.body;
  }

  static Future<Map<String, dynamic>> getTest(lesson) async {
    Response res = await http.get(
      Uri.http(Prefs.get('ip4'), '/test', {'lesson' : lesson}),
      headers: {
        'x-access-token' : Prefs.get('token')
      }
    );
    return json.decode(res.body);
  }

  static Future<Map<String, dynamic>> getLessons() async {
    Response res = await http.get(
      Uri.http(Prefs.get('ip4'), '/lessons'),
      headers: {
        'x-access-token' : Prefs.get('token')
      }
    );
    return json.decode(res.body);
}
}
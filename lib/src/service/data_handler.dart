import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:pvs/src/service/shared_preferences.dart';

class DataHandler {
  static Future<Map<String, dynamic>?> getQuestion() async {
    Response res = await http.get(
        Uri.http('${Prefs.get('ip4')}', '/q', {'file': 'text_questions/question1.txt'}),
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
    print(res);
    return res.body;
  }
}
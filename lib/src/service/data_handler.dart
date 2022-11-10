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

  static Future<String> getRsult(String id, String lesson) async {
    Response res = await http.get(
      Uri.http('${Prefs.get('ip4')}', '/result', {
        'id' : id,
        'lesson' : lesson
      }),
      headers: {
        'x-access-token' : Prefs.get('token')
      }
    );
    return json.decode(res.body)['result'];
  }

  static Future<List<dynamic>> getTest(lesson) async {
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

  static Future<Map<String, dynamic>> submitTest(String lesson, int test, List<String> result) async {
    Response res = await http.post(
      Uri.parse('http://${Prefs.get('ip4')}/submit_test'),
      headers: {
        'x-access-token' : Prefs.get('token'),
        'content-type' : 'application/json'
      },
      body: json.encode({
        "lesson" : lesson,
        "test" : test,
        "result" : result
      })
    );
    return json.decode(res.body);
  }
}
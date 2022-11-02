import 'dart:convert';
import 'package:http/http.dart';
import 'package:pvs/src/service/local_authentication.dart';
import 'package:http/http.dart' as http;

class DataHandler {
  static Future<Map<String, dynamic>?> getQuestion() async {
    Response res = await http.get(
        Uri.http('${LocalAuthentication.ip4}', '/q', {'file': 'text_questions/question1.txt'}),
    );
    return json.decode(res.body);
  }

  static Future<String> getRsult() async {
    Response res = await http.get(
      Uri.parse('${LocalAuthentication.ip4}'),
      headers: {
        'x-access-token' : LocalAuthentication.token!
      }
    );
    print(res);
    return res.body;
  }
}
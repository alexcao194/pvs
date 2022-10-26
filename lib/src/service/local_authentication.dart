import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LocalAuthentication {
  static http.Client client = Client();
  static String? token;
  static String? refreshToken;
  static String? ip4;

  static Future<String?> login(String id, String password) async {
    await client.post(Uri.parse('http://${LocalAuthentication.ip4}/login'),
        headers: {
          'content-type' : 'application/json'
        },
        body: json.encode({
          "id" : id,
          "password" : password
        })
    ).then((value) {
      var outcome = json.decode(value.body);
      token = outcome["accessToken"];
      refreshToken = outcome["refreshToken"];
      return outcome["message"];
    });
    return null;
  }

  static Future<String> upload(String address, String filePath, String fileName,
      Map<String, String> request) async {
    var postUri = Uri.http(ip4!, address, request);
    var req = http.MultipartRequest("POST", postUri);
    await http.MultipartFile.fromPath('image', filePath, filename: fileName)
        .then((file) {
      req.files.add(file);
    });
    http.StreamedResponse response = await req.send();
    return response.statusCode.toString();
  }
}

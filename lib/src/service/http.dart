import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:convert';

class HTTP {
  static String ip4 = 'localhost';
  static Future<String> get(String address, Map<String, String> request) async {
    var url = Uri.http(ip4, address, request);
    var response = await http.get(url);
    return response.body;
  }

  static Future<String> post(String address, Map<String, String> request) async {
    var url = Uri.http(ip4, address, request);
    var response = await http.post(url);
    return response.body;
  }

  static Future<String> upload(String address, String filePath, String fileName, Map<String, String> request) async {
    var postUri = Uri.http(ip4, address, request);
    var req = http.MultipartRequest("POST", postUri);
    await http.MultipartFile.fromPath(
        'image',
        filePath,
      filename: fileName
    ).then((file) {
      req.files.add(file);
    });
    http.StreamedResponse response = await req.send();
    return response.statusCode.toString();
  }
}



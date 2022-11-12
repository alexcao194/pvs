import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pvs/src/service/shared_preferences.dart';

class LocalAuthentication {
  static http.Client client = Client();

  static Future<String?> login(String id, String password) async {
    if(Prefs.get('ip4') == null) {
      return 'no-ip4';
    }
    if(id == '' || password == '') {
      return 'input-empty';
    }
    Response res = await client.post(Uri.parse('http://${Prefs.get('ip4')}/login'),
        headers: {
          'content-type' : 'application/json'
        },
        body: json.encode({
          "id" : id,
          "password" : password
        })
    );
    var outcome = json.decode(res.body);
    if(outcome['accessToken'] != null) {
      await Prefs.set('token', outcome["accessToken"]);
      await Prefs.set('refreshToken', outcome["refreshToken"]);
    }
    return outcome['message'];
  }

  static Future<Map<String, dynamic>?> getUser(String token) async {
    if(Prefs.get('ip4') == null) {
      return {
        'message' : 'no-ip4'
      };
    }
    Response res = await client.get(Uri.parse('http://${Prefs.get('ip4')}/user'),
      headers: {
        'x-access-token' : token
      });
    return json.decode(res.body);
  }

  static Future<String?> signup(String id, String password, String rePassword, String email) async {
    if(id == '' || password == '' || rePassword == '' || email == '') {
      return 'input-empty';
    }
    if(rePassword != password) {
      return 'password-not-match';
    }
    Response res = await client.post(Uri.parse('http://${Prefs.get('ip4')}/signup'),
        headers: {
          'content-type' : 'application/json'
        },
        body: json.encode({
          "id" : id,
          "password" : password,
          "repassword" : rePassword,
          "email" : email
        })
    );
    return json.decode(res.body)['message'];
  }

  static Future<String?> registry(String displayName, String birthday, String group, String gender, String phoneNumber, String id, XFile? avatar) async {
    if(displayName == ''|| birthday == ''|| group == ''|| gender == ''|| phoneNumber == ''|| id == '') return 'input-empty';
    Response res = await client.post(Uri.parse('http://${Prefs.get('ip4')}/registry'),
        headers: {
          'content-type' : 'application/json'
        },
        body: json.encode({
          "displayName" : displayName,
          "birthday" : birthday,
          "groupClass" : group,
          "gender": gender,
          "phoneNumber": phoneNumber,
          "id": id,
          "avatar" : avatar != null ? "users/$id/avatar.jpg" : 'undefined'
        })
    );
    if(avatar != null) {
      await upload('/avatar', File(avatar.path).path, '$id/avatar.jpg', {});
    }
    return json.decode(res.body)['message'];
  }

  static Future<String?> updateProfile(String email, String phoneNumber, String birthday, String gender, XFile? avatar) async {
    Response res = await client.post(Uri.parse('http://${Prefs.get('ip4')}/update-profile'),
      headers: {
        'content-type' : 'application/json',
        'x-access-token' : Prefs.get('token')
      },
      body: json.encode({
        'email' : email,
        'phoneNumber' : phoneNumber,
        'birthday' : birthday,
        'gender' : gender,
        'avatar' : avatar != null ? "hasData" : 'undefined'
      })
    );
    return json.decode(res.body)['message'];
  }

  static Future<Map<String, dynamic>> refreshToken() async {
    Response res = await client.post(Uri.parse('http://${Prefs.get('ip4')}/refresh-token'),
      headers: {
        'content-type' : 'application/json'
      },
      body: json.encode({
        'refreshToken' : Prefs.get('refreshToken')
      })
    );
    return json.decode(res.body);
  }

  static Future<String?> upload(String address, String filePath, String fileName, Map<String, String> request) async {
    var postUri = Uri.http(Prefs.get('ip4'), address, request);
    var req = http.MultipartRequest("POST", postUri);
    await http.MultipartFile.fromPath('avatar', filePath, filename: fileName).then((file) {
      req.files.add(file);
    });
    http.StreamedResponse response = await req.send();
    return response.statusCode.toString();
  }

  static Future<String?> checkin(String address, String filePath, String fileName, Map<String, String> request) async {
    var postUri = Uri.http(Prefs.get('ip4'), address, request);
    var req = http.MultipartRequest("POST", postUri);
    await http.MultipartFile.fromPath('checkin', filePath, filename: fileName).then((file) {
      req.files.add(file);
    });
    http.StreamedResponse response = await req.send();
    return response.statusCode.toString();
  }

  static avatar(String id) {
    return "http://${Prefs.get('ip4')}/users/$id/avatar.jpg";
  }
}

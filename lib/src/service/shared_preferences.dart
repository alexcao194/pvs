import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences? _prefs;
  static bool hasGet = false;
  static Future<SharedPreferences?> get instance async {
    if(_prefs == null) initial();
    return _prefs;
  }
  static void initial() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static set(String key, String value) async {
    await _prefs?.setString(key, value);

  }

  static get(String key) {
    var result =  _prefs?.get(key);
    return result != null ? result.toString() : "";
  }
}
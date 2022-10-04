import 'package:network_info_plus/network_info_plus.dart';

class AppNetworkInfo {
  static NetworkInfo instance = NetworkInfo();

  static Future<String?> get wifiIp4 async {
    String? result;
    result = await instance.getWifiIP();
    result = '${result!.substring(0, result.length - 1)}${String.fromCharCode(result.codeUnitAt(result.length - 1) + 1)}:1904';
    print(result);
    return result;
  }
}
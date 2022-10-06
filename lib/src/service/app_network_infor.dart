import 'package:network_info_plus/network_info_plus.dart';

class AppNetworkInfo {
  static NetworkInfo instance = NetworkInfo();

  static String? IP4 = '192.168.2.175:1904';

  static Future<String?> get wifiIp4 async {
    IP4 = await instance.getWifiIP();
    IP4 = '${IP4!.substring(0, IP4!.length - 1)}:1904';
    return IP4;
  }
}
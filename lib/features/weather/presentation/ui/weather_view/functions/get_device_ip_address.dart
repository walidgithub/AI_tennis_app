import 'package:permission_handler/permission_handler.dart';
import 'package:network_info_plus/network_info_plus.dart';

gettingIP() async {
  await Permission.location.request();
  final info = NetworkInfo();
  var hostAddress = await info.getWifiIP();
  return hostAddress;
}
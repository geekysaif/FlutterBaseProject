import 'dart:io';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter/widgets.dart'; // For MediaQuery
import 'package:device_info_plus/device_info_plus.dart';

class DeviceUtils {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  /// Determines the device type as a string.
  static Future<String> getDeviceTypeAsString() async {
    if (kIsWeb) {
      return 'web';
    }

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      return 'desktop';
    }

    if (Platform.isAndroid || Platform.isIOS) {
      final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
      if (data.size.shortestSide >= 600) {
        if (Platform.isIOS) {
          final iosInfo = await _deviceInfo.iosInfo;
          if (iosInfo.model.toString().toLowerCase().contains('ipad')) {
            return 'iPad';
          }
        }
        return 'tablet';
      }
      return 'mobile';
    }

    return 'Unknown';
  }
}

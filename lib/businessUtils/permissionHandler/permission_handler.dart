import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  // Check camera permission
  static Future<bool> checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      // If the permission is denied, request it
      if (status.isDenied) {
        var result = await Permission.camera.request();
        return result.isGranted;
      }
      // If the permission is permanently denied, show a message directing the user to the settings
      if (status.isPermanentlyDenied) {
        // Optionally, show a message explaining why the permission is required
        openAppSettings();
        return false;
      }
    }
    return true;  // Permission is already granted
  }

  // Check gallery permission for Android 13 and above
  static Future<bool> checkGalleryPermission() async {
    var status = await Permission.photos.status; // For Android 13 and higher
    if (!status.isGranted) {
      // If the permission is denied, request it
      if (status.isDenied) {
        var result = await Permission.photos.request();
        return result.isGranted;
      }
      // If the permission is permanently denied, show a message directing the user to the settings
      if (status.isPermanentlyDenied) {
        // Optionally, show a message explaining why the permission is required
        openAppSettings();
        return false;
      }
    }
    return true;  // Permission is already granted
  }
}

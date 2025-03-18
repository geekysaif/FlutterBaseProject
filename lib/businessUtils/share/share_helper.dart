import 'package:share_plus/share_plus.dart';

class ShareHelper {
  /// Global function to share two texts
  static Future<void> shareText(String text1, String text2) async {
    try {
      // Combine both texts with a separator (e.g., newline or any separator you prefer)
      final String combinedText = '$text1\n\n$text2';

      // Share the combined text
      await Share.share(combinedText);
    } catch (e) {
      print('Error while sharing: $e');
    }
  }
}

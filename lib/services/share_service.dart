import "package:flutter/services.dart";
import "package:share_plus/share_plus.dart";
import "package:url_launcher/url_launcher.dart";

/// Wraps result-sharing so pages don't need to know the mechanics.
class ShareService {
  ShareService._();

  static Future<void> shareResult(String text) async {
    await Share.share(text);
  }

  static Future<void> shareToWhatsapp(String text) async {
    final uri = Uri.parse("https://wa.me/?text=${Uri.encodeComponent(text)}");
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  static Future<void> copyLink(String link) async {
    await Clipboard.setData(ClipboardData(text: link));
  }

  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

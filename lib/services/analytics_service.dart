import "package:flutter/foundation.dart";

/// Lightweight event tracking stub.
/// Swap the body of `track` for Firebase Analytics (or similar) later —
/// call sites throughout the app stay the same.
class AnalyticsService {
  AnalyticsService._();

  static void track(String name, [Map<String, dynamic>? data]) {
    if (kDebugMode) {
      debugPrint("[tsc:event] $name ${data ?? ''}");
    }
  }
}

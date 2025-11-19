import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;

/// Static configuration and environment helpers
class Env {
  /// Whether the app is running in debug mode
  static bool get isDebug => kDebugMode;

  static String get appUrl => const String.fromEnvironment(
    'APP_URL',
    defaultValue: 'https://ocean-of-pdf-epub-fix.vercel.app/',
  );

  static String get oopUrl => const String.fromEnvironment(
    "OOP_URL",
    defaultValue: "https://oceanofpdf.com/",
  );

  /// Whether the app is running on web platform
  static bool get isWeb => kIsWeb;

  /// Whether the app is running in a browser (desktop or mobile)
  static bool get isBrowser =>
      isWeb && web.window.matchMedia('(display-mode: browser)').matches;

  /// Whether the app is running as an installed PWA
  static bool get isPwa =>
      isWeb && web.window.matchMedia('(display-mode: standalone)').matches;
}

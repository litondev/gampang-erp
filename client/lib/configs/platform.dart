import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;

class AppPlatform {
  static String getPlatform() {
    if (kIsWeb) return "Web";
    if (Platform.isAndroid) return "Android";
    if (Platform.isIOS) return "iOS";
    if (Platform.isWindows) return "Windows";
    if (Platform.isMacOS) return "MacOS";
    if (Platform.isLinux) return "Linux";
    return "Unknown";
  }

  static bool get isWeb => kIsWeb;
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;
  static bool get isIOS => !kIsWeb && Platform.isIOS;
  static bool get isWindows => !kIsWeb && Platform.isWindows;
  static bool get isMacOS => !kIsWeb && Platform.isMacOS;
  static bool get isLinux => !kIsWeb && Platform.isLinux;
}

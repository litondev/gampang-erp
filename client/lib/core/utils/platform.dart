import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

class UtilPlatform {
  /// Cek apakah berjalan di Web
  static bool get isWeb => kIsWeb;

  /// Cek apakah berjalan di Mobile (Android/iOS)
  static bool get isMobile => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  /// Cek apakah berjalan di Desktop (Windows/Mac/Linux)
  static bool get isDesktop =>
      !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);

  static bool get isAndroid => !kIsWeb && Platform.isAndroid;
  static bool get isIOS => !kIsWeb && Platform.isIOS;
  static bool get isWindows => !kIsWeb && Platform.isWindows;
  static bool get isMacOS => !kIsWeb && Platform.isMacOS;
  static bool get isLinux => !kIsWeb && Platform.isLinux;
}

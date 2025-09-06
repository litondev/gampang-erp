import 'package:flutter/material.dart';

class AppDimension {
  // Cek width untuk responsive
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 900;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600 && width < 900;
  }

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  // Return langsung tipe sebagai string
  static String platformType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 900) return "Desktop";
    if (width >= 600) return "Tablet";
    return "Mobile";
  }
}
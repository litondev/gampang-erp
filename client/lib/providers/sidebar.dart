import 'package:flutter/material.dart';

class SidebarProvider with ChangeNotifier {
  String _menu = "dashboard";

  String get menu => _menu;

  void selectMenu(String menu) {
    _menu = menu;
    notifyListeners();
  }
}

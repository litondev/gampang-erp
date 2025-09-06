import 'package:flutter/material.dart';

class SelectedMenuProvider with ChangeNotifier {
  String _menu = "dashboard";
  String get menu => _menu;

  void selectMenu(String menu) {
    _menu = menu;
    notifyListeners();
  }
}

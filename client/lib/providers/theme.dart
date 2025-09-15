import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  String? _themeMode = "light";

  ThemeProvider(this._themeMode);

  ThemeMode get themeMode => _themeMode == "light" ? ThemeMode.light : ThemeMode.dark;

  void toggleTheme() {
    _themeMode = _themeMode == "light" ? "dark" : "light";
    
    notifyListeners();
  }
}
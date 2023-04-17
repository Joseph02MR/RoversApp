import 'package:flutter/material.dart';
import 'package:api_project/settings/styles_settings.dart';

class ThemeProvider with ChangeNotifier {
  BuildContext? context;
  ThemeData? _themeData;

  ThemeProvider(BuildContext context) {
    _themeData = StylesSettings.darkTheme(context);
  }

  getThemeData() => _themeData;
  setThemeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}

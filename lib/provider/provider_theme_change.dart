import 'package:flutter/cupertino.dart';

import '../core/constants/current_them_mode.dart';
import '../core/constants/dark_mode.dart';
import '../core/constants/light_mode.dart';

class ChangeThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  void changeTheme() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      changeToDark();
    } else {
      changeToLight();
    }
    notifyListeners();
  }

  void changeToDark() {
    CurrentThemMode.scaffoldColor = DarkMode.scaffoldColor;
  }

  void changeToLight() {
    CurrentThemMode.scaffoldColor = LightMode.scaffoldColor;
  }
}
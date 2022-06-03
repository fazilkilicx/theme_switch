import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemesController extends GetxController {
  // The default theme is system.
  RxString theme = 'system'.obs;
  // Key value for theme information that we will keep in Shared Preferences.
  final themeKey = 'theme';

  @override
  void onInit() async {
    super.onInit();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    theme.value = prefs.getString(themeKey) ?? 'system';

    Get.changeThemeMode(theme.value == 'light'
        ? ThemeMode.light
        : theme.value == 'dark'
            ? ThemeMode.dark
            : ThemeMode.system);
    await prefs.setString(themeKey, theme.value);

    // log
    debugPrint('theme value: ${theme.value.toString()}');
    debugPrint('theme prefs: ${prefs.getString(themeKey).toString()}');
  }

  changeTheme({required String whichTheme}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    theme.value = whichTheme;
    await prefs.setString(themeKey, whichTheme);

    switch (whichTheme) {
      case 'light':
        Get.changeThemeMode(ThemeMode.light);
        break;
      case 'dark':
        Get.changeThemeMode(ThemeMode.dark);
        break;
      default:
        Get.changeThemeMode(ThemeMode.system);
        break;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final themeController = Get.put(ThemesController());

    return GetMaterialApp(
      title: 'Theme Switch',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemesController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Switch Example'),
      ),
      body: Column(
        children: [
          Obx(() => SwitchListTile(
                title: const Text('Dark mode'),
                value: themeController.theme.value == 'dark' ? true : false,
                onChanged: (val) {
                  val
                      ? themeController.changeTheme(whichTheme: 'dark')
                      : themeController.changeTheme(whichTheme: 'light');
                },
              )),
          Obx(
            () => SwitchListTile(
              title: const Text('Use device settings'),
              value: themeController.theme.value == 'system' ? true : false,
              onChanged: (val) {
                themeController.changeTheme(whichTheme: 'system');
              },
            ),
          ),
        ],
      ),
    );
  }
}

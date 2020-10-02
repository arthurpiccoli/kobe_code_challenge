import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobe_code_challenge/constants/strings.dart';
import 'package:kobe_code_challenge/routes/get_pages.dart';

void main() {
  runApp(WhatToWatchApp());
}

class WhatToWatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.appName,
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.yellow,
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow),
        ),
      ),
      getPages: getPages,
    );
  }
}

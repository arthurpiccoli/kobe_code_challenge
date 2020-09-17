import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobe_code_challenge/routes/get_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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

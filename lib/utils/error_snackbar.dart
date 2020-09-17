import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobe_code_challenge/constants/strings.dart';

void showErrorSnackbar(dynamic error) => Get.snackbar(
      Strings.error,
      error.toString(),
      colorText: Colors.black,
      backgroundColor: Get.theme.accentColor,
      margin: EdgeInsets.all(10),
    );

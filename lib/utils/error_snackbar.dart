import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorSnackbar(dynamic error) => Get.snackbar(
      "Oops, an error has ocurred!",
      error.toString(),
      colorText: Colors.black,
      backgroundColor: Get.theme.accentColor,
      margin: EdgeInsets.all(10),
    );

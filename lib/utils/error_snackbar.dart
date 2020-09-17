import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorSnackbar(dynamic error) => Get.snackbar(
      "Oops, an error has ocurred!",
      error.toString(),
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.black,
      backgroundColor: Colors.white,
      duration: Duration(seconds: 5),
      margin: EdgeInsets.all(10),
    );

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHelperFunctions {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(Get.context!).size.width;
  }
}

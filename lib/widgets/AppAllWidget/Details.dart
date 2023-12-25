import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppAllWidget allWidget = Get.put(AppAllWidget());

class AppAllWidget extends GetxController {
  var backgroundColor = [
    const Color(0xFF0766AD),
    const Color(0xFF03253F),
  ];
  var appBarColor = const Color(0xFF0766AD);

  var whiteColor = Colors.white;

  var homeScreenBackgroundColor = const Color(0xFF9BC1DE);
}

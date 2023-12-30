import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppColorWidget appColorWidget = Get.put(AppColorWidget());
AppImageWidget appImageWidget = Get.put(AppImageWidget());

class AppColorWidget extends GetxController {
  var backgroundColor = [
    const Color(0xFF0766AD),
    const Color(0xFF03253F),
  ];
  var appBarColor = const Color(0xFF0766AD);

  var whiteColor = Colors.white;
  var blackColor = Colors.black;

  var homeScreenBackgroundColor = const Color(0xFF9BC1DE);
}

class AppImageWidget extends GetxController {
  var logo = "images/Logo 2.png";
  var googleImage = "images/google.png";

  var edite_Profile_Image = "images/icons/edite_profile.png";
  var home_Image ="images/icons/home.png";
  var logout_Image = "images/icons/logout.png";
  var user_Image = "images/icons/user.png";
  var background_Image = "assets/icons/background.jpg";

  var add_Image = "images/add_image.png";
  var avatar_Image = "images/avatar/avatar.png";
}

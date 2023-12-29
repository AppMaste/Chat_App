import 'package:chat_demo_app/widgets/AppAllWidget/height.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

ContainerWidget containerWidget = Get.put(ContainerWidget());

class ContainerWidget extends GetxController {
  bottomContainer(
      BuildContext context, String name, String icon, bool tap, var ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            color: tap == true ? Colors.black : Colors.grey,
            scale: ScreenSize.fSize_20(),
          ),
          SizedBox(height: ScreenSize.fSize_10()),
          Text(
            name,
            style: GoogleFonts.lexend(
              color: tap == true ? Colors.black : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}

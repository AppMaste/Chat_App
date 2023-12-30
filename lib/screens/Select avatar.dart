import 'dart:developer';

import 'package:chat_demo_app/widgets/AppAllWidget/Details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

var pickImage = "".obs;

class SelectAvatarScreen extends StatelessWidget {
  SelectAvatarScreen({super.key});

  var image = [
    "images/avatar/IMAGE 1.png",
    "images/avatar/IMAGE 2.png",
    "images/avatar/IMAGE 3.png",
    "images/avatar/IMAGE 4.png",
    "images/avatar/IMAGE 5.png",
    "images/avatar/IMAGE 6.png",
    "images/avatar/IMAGE 7.png",
    "images/avatar/IMAGE 8.png",
    "images/avatar/IMAGE 9.png",
    "images/avatar/IMAGE 10.png",
    "images/avatar/IMAGE 11.png",
    "images/avatar/IMAGE 12.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Avatar",
          style: GoogleFonts.lexend(),
        ),
      ),
      body: GridView.builder(
        itemCount: image.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Get.back();
                pickImage.value = image[index];
                log('imageeeeeeeee $pickImage');
              },
              child: Container(
                decoration: BoxDecoration(
                    color: appColorWidget.whiteColor,
                    boxShadow: [
                      BoxShadow(
                          color: appColorWidget.blackColor,
                          blurRadius: 5,
                          offset: const Offset(0, 3))
                    ],
                    shape: BoxShape.circle,
                    border: Border.all(color: appColorWidget.blackColor)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    image[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
      ),
    );
  }
}

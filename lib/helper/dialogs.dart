import 'package:chat_demo_app/widgets/AppAllWidget/Details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dialogs {
  static void showSnackbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          msg,
          style: GoogleFonts.lexend(color: appColorWidget.blackColor),
        ),
        backgroundColor: appColorWidget.whiteColor,
        behavior: SnackBarBehavior.floating),);
  }

  static void showProgressBar(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => const Center(child: CircularProgressIndicator()));
  }
}

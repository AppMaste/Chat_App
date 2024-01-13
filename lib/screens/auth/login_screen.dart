import 'dart:developer';
import 'dart:io';

import 'package:chat_demo_app/widgets/AppAllWidget/height.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../api/apis.dart';
import '../../helper/dialogs.dart';
import '../../main.dart';
import '../../widgets/AppAllWidget/Details.dart';
import '../home_screen.dart';

//login screen -- implements google sign in or sign up feature for app
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAnimate = false;

  @override
  void initState() {
    super.initState();

    //for auto triggering animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => _isAnimate = true);
    });
  }

  // handles google login button click
  _handleGoogleBtnClick() {
    //for showing progress bar
    Dialogs.showProgressBar(context);

    _signInWithGoogle().then((user) async {
      //for hiding progress bar
      Navigator.pop(context);

      if (user != null) {
        log('\nUser: ${user.user}');
        log('\nUserAdditionalInfo: ${user.additionalUserInfo}');

        if ((await APIs.userExists())) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        } else {
          await APIs.createUser().then((value) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          });
        }
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      log('\n_signInWithGoogle: $e');
      // Dialogs.showSnackbar(context, 'Something Went Wrong (Check Internet!)');
      Dialogs.showSnackbar(context, '${e.toString()}');
      return null;
    }
  }

  //sign out function
  // _signOut() async {
  //   await FirebaseAuth.instance.signOut();
  //   await GoogleSignIn().signOut();
  // }

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    //initializing media query (for getting device screen size)
    // mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      //app bar
      appBar: AppBar(
        backgroundColor: appColorWidget.blackColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Welcome to ChatMingle',
          style: GoogleFonts.lexend(
            color: Colors.white,
          ),
        ),
      ),

      //body
      body: Container(
        decoration: const BoxDecoration(),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            // Screen look
            //app logo
            AnimatedPositioned(
              top: mq.height * .15,
              right: _isAnimate ? mq.width * .13 : -mq.width * .5,
              // width: mq.width * .5,
              duration: const Duration(seconds: 1),
              child: Image.asset(appImageWidget.logo),
            ),

            //google login button
            Positioned(
              bottom: mq.height * .20,
              left: mq.width * .05,
              width: mq.width * .9,
              height: mq.height * .06,
              child: GestureDetector(
                onTap: () {
                  _handleGoogleBtnClick();
                },
                child: Container(
                  height: mq.height,
                  width: mq.width * 5,
                  decoration: BoxDecoration(
                      color: appColorWidget.appBarColor,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(appImageWidget.googleImage,
                          height: mq.height * .04),
                      SizedBox(width: ScreenSize.fSize_20()),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.lexend(
                              color: Colors.black, fontSize: 16),
                          children: [
                            TextSpan(
                              text: 'Login with ',
                              style: GoogleFonts.lexend(
                                color: appColorWidget.whiteColor,
                              ),
                            ),
                            TextSpan(
                              text: 'Google',
                              style: GoogleFonts.lexend(
                                fontWeight: FontWeight.bold,
                                color: appColorWidget.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

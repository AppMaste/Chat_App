import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 360,
        height: 800,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Color(0xFF9BC1DE),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 730,
              child: Container(
                width: 360,
                height: 82,
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 360,
                height: 82,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 360,
                        height: 82,
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 360,
                        height: 47,
                        padding: const EdgeInsets.only(
                          top: 14,
                          left: 12,
                          right: 11.60,
                          bottom: 12,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: double.infinity,
                                padding: const EdgeInsets.only(top: 1),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 54,
                                      height: 20,
                                      child: Text(
                                        '1:41',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          height: 0.08,
                                          letterSpacing: -0.41,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 77.40,
                              height: 13,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 50,
                                    top: 0,
                                    child: Container(
                                      width: 27.40,
                                      height: 13,
                                      child: Stack(children: []),
                                    ),
                                  ),
                                  Positioned(
                                    left: 26,
                                    top: 1,
                                    child: Container(
                                      width: 17,
                                      height: 12,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "https://via.placeholder.com/17x12"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 157,
              top: 47,
              child: Text(
                'Chat',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w500,
                  height: 0.06,
                  letterSpacing: -0.41,
                ),
              ),
            ),
            Positioned(
              left: 21,
              top: 102,
              child: Container(
                width: 318,
                height: 66,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 318,
                        height: 66,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 7,
                      top: 12,
                      child: Container(
                        width: 301,
                        height: 41,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 41,
                                height: 41,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 41,
                                        height: 41,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF33B065),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 11,
                                      top: 9,
                                      child: Text(
                                        'O',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontFamily: 'Lexend',
                                          fontWeight: FontWeight.w400,
                                          height: 0.04,
                                          letterSpacing: -0.41,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 55,
                              top: 0,
                              child: Container(
                                width: 246,
                                height: 41,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 30,
                                        height: 41,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Text(
                                                'One',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontFamily: 'Lexend',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0.10,
                                                  letterSpacing: -0.41,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 0,
                                              top: 19,
                                              child: Text(
                                                'Hii',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF625F5F),
                                                  fontSize: 15,
                                                  fontFamily: 'Lexend',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0.10,
                                                  letterSpacing: -0.41,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 215,
                                      top: 10,
                                      child: Text(
                                        '22 Dec',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF625F5F),
                                          fontSize: 10,
                                          fontFamily: 'Lexend',
                                          fontWeight: FontWeight.w400,
                                          height: 0.22,
                                          letterSpacing: -0.41,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 21,
              top: 178,
              child: Container(
                width: 318,
                height: 66,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 318,
                        height: 66,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 7,
                      top: 12,
                      child: Container(
                        width: 301,
                        height: 41,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 41,
                                height: 41,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 41,
                                        height: 41,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFAE62D2),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 14,
                                      top: 9,
                                      child: Text(
                                        'T',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontFamily: 'Lexend',
                                          fontWeight: FontWeight.w400,
                                          height: 0.04,
                                          letterSpacing: -0.41,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 56,
                              top: 0,
                              child: Container(
                                width: 245,
                                height: 41,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 39,
                                        height: 41,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Text(
                                                'Two',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontFamily: 'Lexend',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0.10,
                                                  letterSpacing: -0.41,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 0,
                                              top: 19,
                                              child: Text(
                                                'Hello!',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF625F5F),
                                                  fontSize: 15,
                                                  fontFamily: 'Lexend',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0.10,
                                                  letterSpacing: -0.41,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 214,
                                      top: 10,
                                      child: Text(
                                        '23 Dec',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF625F5F),
                                          fontSize: 10,
                                          fontFamily: 'Lexend',
                                          fontWeight: FontWeight.w400,
                                          height: 0.22,
                                          letterSpacing: -0.41,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 30,
              top: 742,
              child: Container(
                width: 301,
                height: 46,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 3,
                      child: Container(
                        width: 31,
                        height: 43,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 21,
                              child: Text(
                                'Home',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11,
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.w400,
                                  height: 0.18,
                                  letterSpacing: -0.41,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 265,
                      top: 2,
                      child: Container(
                        width: 36,
                        height: 44,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 22,
                              child: Text(
                                'Logout',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF808080),
                                  fontSize: 11,
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.w400,
                                  height: 0.18,
                                  letterSpacing: -0.41,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 59,
                      top: 1,
                      child: Container(
                        width: 46,
                        height: 45,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 23,
                              child: Text(
                                'Add User',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF808080),
                                  fontSize: 11,
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.w400,
                                  height: 0.18,
                                  letterSpacing: -0.41,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 132,
                      top: 0,
                      child: Container(
                        width: 35,
                        height: 46,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 24,
                              child: Text(
                                'Search',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF808080),
                                  fontSize: 11,
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.w400,
                                  height: 0.18,
                                  letterSpacing: -0.41,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 5,
                              top: 0,
                              child: Container(
                                width: 25,
                                height: 25,
                                child: Stack(children: []),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 186,
                      top: 2,
                      child: Container(
                        width: 61,
                        height: 44,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 22,
                              child: Text(
                                'Edite Profile',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF808080),
                                  fontSize: 11,
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.w400,
                                  height: 0.18,
                                  letterSpacing: -0.41,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';
import 'dart:io';
import 'package:chat_demo_app/widgets/AppAllWidget/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../api/apis.dart';
import '../helper/dialogs.dart';
import '../main.dart';
import '../models/chat_user.dart';
import '../widgets/AppAllWidget/Details.dart';
import '../widgets/AppAllWidget/height.dart';
import '../widgets/chat_user_card.dart';
import 'auth/login_screen.dart';
import 'demo Page.dart';
import 'profile_screen.dart';

List emailList = [];

Future<bool> _onWillPop(BuildContext context) async {
  bool? exitResult = await showDialog(
    context: context,
    builder: (context) => _buildExitDialog(context),
  );
  return exitResult ?? false;
}

Scaffold _buildExitDialog(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.transparent,
    body: Center(
      child: Container(
        height: 250,
        width: 300,
        decoration: BoxDecoration(
          color: appColorWidget.homeScreenBackgroundColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: appColorWidget.whiteColor.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 5,
                offset: const Offset(0, 2)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "EXIT",
              style: GoogleFonts.lexend(
                fontWeight: FontWeight.w700,
                color: appColorWidget.blackColor,
                fontSize: 25,
              ),
            ),
            Text(
              "Do you really want to Exit?",
              textAlign: TextAlign.center,
              style: GoogleFonts.lexend(
                fontWeight: FontWeight.w400,
                color: appColorWidget.blackColor,
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(false),
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: appColorWidget.homeScreenBackgroundColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                      boxShadow: const [
                        BoxShadow(color: Colors.black, blurRadius: 5)
                      ],
                      border: Border.all(color: appColorWidget.blackColor),
                    ),
                    child: Center(
                      child: Text(
                        "No",
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.bold,
                          color: appColorWidget.blackColor,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    exit(0);
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: appColorWidget.homeScreenBackgroundColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                      boxShadow: const [
                        BoxShadow(color: Colors.black, blurRadius: 5)
                      ],
                      border: Border.all(color: appColorWidget.blackColor),
                    ),
                    child: Center(
                      child: Text(
                        "Yes",
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.bold,
                          color: appColorWidget.blackColor,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

//home screen -- where all available contacts are shown
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // for storing all users
  List<ChatUser> _list = [];
  List empty = [];

  // for storing searched items
  final List<ChatUser> _searchList = [];

  // for storing search status
  bool _isSearching = false;
  var userFind = 0.obs;

  RxInt number = 0.obs;

  @override
  void initState() {
    super.initState();
    APIs.getSelfInfo();

    //for updating user active status according to lifecycle events
    //resume -- active or online
    //pause  -- inactive or offline
    SystemChannels.lifecycle.setMessageHandler((message) {
      log('Message: $message');

      if (APIs.auth.currentUser != null) {
        if (message.toString().contains('resume')) {
          APIs.updateActiveStatus(true);
        }
        if (message.toString().contains('pause')) {
          APIs.updateActiveStatus(false);
        }
      }

      return Future.value(message);
    });
  }

  var home = true.obs;
  var addUser = false.obs;
  var editeProfile = false.obs;
  var logout = false.obs;

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: GestureDetector(
        //for hiding keyboard when a tap is detected on screen
        onTap: () => FocusScope.of(context).unfocus(),
        child: WillPopScope(
          //if search is on & back button is pressed then close search
          //or else simple close current screen on back button click
          onWillPop: () {
            if (_isSearching) {
              setState(() {
                _isSearching = !_isSearching;
              });
              return Future.value(false);
            } else {
              return Future.value(true);
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            //app bar
            appBar: AppBar(
              // backgroundColor: allWidget.appBarColor,
              elevation: 0,
              // leading: const Icon(
              //   CupertinoIcons.home,
              // ),
              title: _isSearching
                  ? TextField(
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name, Email, ...'),
                      autofocus: true,
                      style:
                          GoogleFonts.lexend(fontSize: 17, letterSpacing: 0.5),
                      //when search text changes then updated search list
                      onChanged: (val) {
                        //search logic
                        _searchList.clear();

                        for (var i in _list) {
                          if (i.name
                                  .toLowerCase()
                                  .contains(val.toLowerCase()) ||
                              i.email
                                  .toLowerCase()
                                  .contains(val.toLowerCase())) {
                            _searchList.add(i);
                            setState(() {
                              _searchList;
                            });
                          }
                        }
                      },
                    )
                  : Text('Chat Mingle', style: GoogleFonts.lexend()),
              actions: [
                //search user button
                IconButton(
                    onPressed: () {
                      setState(() {
                        _isSearching = !_isSearching;
                      });
                    },
                    icon: Icon(_isSearching
                        ? CupertinoIcons.clear_circled_solid
                        : Icons.search)),
              ],
            ),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () async {
            //     User? user = await AuthService().signInWithGoogle();
            //     if (user != null) {
            //       print("User signed in: ${user.displayName}");
            //     } else {
            //       print("Sign-in failed");
            //     }
            //   },
            // ),

            //body
            body: Container(
              decoration: BoxDecoration(
                  color: appColorWidget.homeScreenBackgroundColor),
              child: Stack(
                children: [
                  // Bottom Navigation Container
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: ScreenSize.horizontalBlockSize! * 35,
                      width: double.maxFinite,
                      color: appColorWidget.whiteColor,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: ScreenSize.fSize_50(),
                          left: ScreenSize.fSize_10(),
                          right: ScreenSize.fSize_10(),
                        ),
                        child: Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              containerWidget.bottomContainer(
                                context,
                                "Home",
                                appImageWidget.home_Image,
                                home.value,
                                () {
                                  home.value = true;
                                  addUser.value = false;
                                  editeProfile.value = false;
                                  logout.value = false;
                                  // findUser();
                                  log("Pressed Home");
                                },
                                ScreenSize.fSize_20(),
                              ),
                              containerWidget.bottomContainer(
                                context,
                                "Find User",
                                appImageWidget.user_Image,
                                addUser.value,
                                () {
                                  Future.delayed(
                                    const Duration(seconds: 1),
                                    () {
                                      home.value = true;
                                      addUser.value = false;
                                      editeProfile.value = false;
                                      logout.value = false;
                                    },
                                  );
                                  home.value = false;
                                  addUser.value = true;
                                  editeProfile.value = false;
                                  logout.value = false;
                                  // _addChatUserDialog();
                                  findUser();
                                  log("Pressed Add User");
                                },
                                ScreenSize.fSize_20(),
                              ),
                              containerWidget.bottomContainer(
                                context,
                                "Edite Profile",
                                appImageWidget.edite_Profile_Image,
                                editeProfile.value,
                                () {
                                  home.value = false;
                                  addUser.value = false;
                                  editeProfile.value = true;
                                  logout.value = false;
                                  log("Pressed Edite Profile");
                                  Get.to(() => ProfileScreen(user: APIs.me))
                                      ?.then((value) {
                                    editeProfile.value = false;
                                    home.value = true;
                                  });
                                },
                                ScreenSize.fSize_15(),
                              ),
                              containerWidget.bottomContainer(
                                context,
                                "logout",
                                appImageWidget.logout_Image,
                                logout.value,
                                () {
                                  home.value = false;
                                  addUser.value = false;
                                  editeProfile.value = false;
                                  logout.value = true;
                                  log("Pressed Logout");
                                  _logout();
                                },
                                ScreenSize.fSize_20(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: ScreenSize.horizontalBlockSize! * 155,
                    color: Colors.transparent,
                    child: StreamBuilder(
                      stream: APIs.getMyUsersId(),
                      //get id of only known users
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          //if data is loading
                          case ConnectionState.waiting:
                          case ConnectionState.none:
                            return const Center(
                                child: CircularProgressIndicator());

                          //if some or all data is loaded then show it
                          case ConnectionState.active:
                          case ConnectionState.done:
                            return StreamBuilder(
                              stream: APIs.getAllUsers(snapshot.data?.docs
                                      .map((e) => e.id)
                                      .toList() ??
                                  []),

                              //get only those user, who's ids are provided
                              builder: (context, snapshot) {
                                switch (snapshot.connectionState) {
                                  //if data is loading
                                  case ConnectionState.waiting:
                                  case ConnectionState.none:
                                  // return const Center(
                                  //     child: CircularProgressIndicator());
                                  //if some or all data is loaded then show it
                                  case ConnectionState.active:
                                  case ConnectionState.done:
                                    final data = snapshot.data?.docs;
                                    _list = data
                                            ?.map((e) =>
                                                ChatUser.fromJson(e.data()))
                                            .toList() ??
                                        [];

                                    if (_list.isNotEmpty) {
                                      return ListView.builder(
                                          itemCount: _isSearching
                                              ? _searchList.length
                                              : 1,
                                          // itemCount: 1,
                                          padding: EdgeInsets.only(
                                              top: mq.height * .01),
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            // log("LISTLISTLIST: ${_list[number.value]}");
                                            // emailList.addAll([_list[index].email]);
                                            return Obx(
                                              () => ChatUserCard(
                                                // user: _isSearching
                                                //     ? _searchList[index]
                                                //     : _list[index],
                                                user:
                                                    _list.length == number.value
                                                        ? _list[0]
                                                        : _list[number.value],
                                              ),
                                            );
                                          });
                                    } else {
                                      return Center(
                                        child: Text('No Connections Found!',
                                            style: GoogleFonts.lexend(
                                                fontSize: 20)),
                                      );
                                    }
                                }
                              },
                            );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // find random user
  void findUser() {
    setState(() {
      if (_list.length != number.value) {
        number.value++;
        // empty.add([number.value]);
        // log("number_number_number ${empty}");
      } else {
        number.value = 0;
        // empty.r(number.value);
        log("errorrrrrrrrrrr");
      }
    });
  }

  // for adding new chat user
  void _addChatUserDialog() {
    String email = '';

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: appColorWidget.homeScreenBackgroundColor,
        contentPadding:
            const EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 10),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

        //title
        title: Row(
          children: [
            const Icon(
              Icons.person_add,
              color: Colors.blue,
              size: 28,
            ),
            Text(
              '  Add User',
              style: GoogleFonts.lexend(),
            )
          ],
        ),

        //content
        content: TextFormField(
          maxLines: null,
          onChanged: (value) => email = value,
          decoration: InputDecoration(
            hintText: 'Email Id',
            hintStyle: GoogleFonts.lexend(color: appColorWidget.blackColor),
            prefixIcon: const Icon(Icons.email, color: Colors.blue),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),

        //actions
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () {
              //hide alert dialog
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: GoogleFonts.lexend(
                  color: appColorWidget.blackColor, fontSize: 16),
            ),
          ),

          //add button
          MaterialButton(
            onPressed: () async {
              //hide alert dialog
              Navigator.pop(context);
              if (email.isNotEmpty) {
                await APIs.addChatUser(email).then(
                  (value) {
                    if (!value) {
                      Dialogs.showSnackbar(context, 'User does not Exists!');
                    }
                  },
                );
              }
            },
            child: Text(
              'Add',
              style: GoogleFonts.lexend(
                  color: appColorWidget.blackColor, fontSize: 16),
            ),
          ),
        ],
      ),
    ).then((value) {
      addUser.value = false;
      home.value = true;
    });
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: appColorWidget.homeScreenBackgroundColor,
        contentPadding:
            const EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 10),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

        //title
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Logout',
              style: GoogleFonts.lexend(),
            ),
            SizedBox(height: ScreenSize.fSize_20()),
            Text(
              'Are you sure you want to logout ?',
              style: GoogleFonts.lexend(
                fontSize: ScreenSize.fSize_14(),
              ),
            ),
          ],
        ),

        //actions
        actions: [
          //cancel button
          GestureDetector(
            onTap: () async {
              // Navigator.pop(context);
              Get.back();
            },
            child: Container(
              height: ScreenSize.fSize_40(),
              width: ScreenSize.fSize_80(),
              decoration: BoxDecoration(
                color: appColorWidget.homeScreenBackgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                boxShadow: const [
                  BoxShadow(color: Colors.black54, blurRadius: 5)
                ],
                border: Border.all(color: appColorWidget.blackColor),
              ),
              child: Center(
                child: Text(
                  'No',
                  style: GoogleFonts.lexend(
                      color: appColorWidget.blackColor, fontSize: 16),
                ),
              ),
            ),
          ),
          SizedBox(width: ScreenSize.fSize_10()),
          GestureDetector(
            onTap: () async {
              //for showing progress dialog
              Dialogs.showProgressBar(context);

              await APIs.updateActiveStatus(false);

              //sign out from app
              await APIs.auth.signOut().then((value) async {
                await GoogleSignIn().signOut().then((value) {
                  //for hiding progress dialog
                  Navigator.pop(context);

                  //for moving to home screen
                  Navigator.pop(context);

                  APIs.auth = FirebaseAuth.instance;

                  //replacing home screen with login screen
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()));
                });
              });
            },
            child: Container(
              height: ScreenSize.fSize_40(),
              width: ScreenSize.fSize_80(),
              decoration: BoxDecoration(
                color: appColorWidget.homeScreenBackgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                boxShadow: const [
                  BoxShadow(color: Colors.black54, blurRadius: 5)
                ],
                border: Border.all(color: appColorWidget.blackColor),
              ),
              child: Center(
                child: Text(
                  'Yes',
                  style: GoogleFonts.lexend(
                      color: appColorWidget.blackColor, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    ).then((value) {
      logout.value = false;
      home.value = true;
    });
  }
}

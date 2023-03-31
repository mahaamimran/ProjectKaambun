// ignore_for_file: use_key_in_widget_constructors, unnecessary_import, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, file_names
import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (BuildContext context) {
        return Scaffold(
          body: Container(
            // background color
            color: Color(0xff212327),
            // padding around borders
            padding: EdgeInsets.all(10.0),
            child: Stack(
              children: [
                // "welcome back"
                Positioned(
                  top: 142,
                  left: 0,
                  right: 0,
                  child: Text(
                    "Welcome back!",
                    key: Key("welcomebackkey"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      // w100 is thin w900 is fat
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                  ),
                ),

                // "you've been missed"
                Positioned(
                  top: 180,
                  left: 0,
                  right: 0,
                  child: Text(
                    "you've been missed.",
                    key: Key("you'vebeenmissedkey"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                  ),
                ),

                // username dabba
                Positioned(
                  left: 0,
                  right: 0,
                  top: 286,
                  child: Container(
                    key: Key("usernamedabba"),
                    // dabba dimentions
                    width: 343,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Color(0xff393c41),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // password dabba
                Positioned(
                  left: 0,
                  right: 0,
                  top: 366,
                  child: Container(
                    key: Key("usernamedabba"),
                    // dabba dimentions
                    width: 343,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Color(0xff393c41),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // username text
                Positioned(
                  top: 307,
                  left: 28,
                  right: 0,
                  child: Text(
                    "Enter Username",
                    key: Key("enterusernamekey"),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                  ),
                ),

                // password text
                Positioned(
                  top: 386,
                  left: 28,
                  right: 0,
                  child: Text(
                    "Password",
                    key: Key("passwordkey"),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                  ),
                ),

                // eye icon
                Positioned(
                  // placement
                  top: 386,
                  left: 330,
                  // dimentions
                  width: 18,
                  height: 17,
                  child: Image.file(
                    width: 16.62,
                    height: 32,
                    File('/Users/mahamimran/project/assets/eyeicon.png'),
                    key: Key('eyeIconKey'),
                  ),
                ),

                // Sign in button
                Positioned(
                  left: 16,
                  top: 469,
                  child: Container(
                    width: 343,
                    height: 56,
                    child: Row(
                      key: Key("SignInButtonKey"),
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign in",
                          key: Key("SignInButtonTextKey"),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Cupertino",
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                    // padding around sign in button
                    padding: EdgeInsets.only(
                      left: 112,
                      right: 112,
                      top: 18,
                      bottom: 18,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3d9471cf),
                          offset: Offset(0, 4),
                          blurRadius: 16,
                        ),
                      ],
                      // gradient
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xffc847f4),
                          Color(0xff6e54f7),
                        ],
                      ),
                    ),
                  ),
                ),

                // recover password
                Positioned(
                  left: 237,
                  top: 438,
                  child: Text(
                    "Recover Password?",
                    key: Key(
                      "RecoverPasswordkey",
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // lines
                Positioned(
                  left: 34,
                  top: 627,
                  child: Container(
                    width: 308,
                    height: 20,
                    padding: EdgeInsets.symmetric(),
                    child: Row(
                      key: Key("LinesKey"),
                      children: [
                        Container(
                          key: Key("Line1Key"),
                          width: 125,
                          height: 0,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Color(0xff787b80),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 55,
                        ),
                        Container(
                          key: Key("Line2Key"),
                          width: 125,
                          height: 0,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Color(0xff787b80),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                ),

                // OR
                Positioned(
                  top: 629,
                  left: 0,
                  right: 0,
                  child: Text(
                    "or",
                    key: Key("orkey"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                  ),
                ),

                // "dont have an account? sign up"
                Positioned(
                  top: 767,
                  left: 0,
                  right: 0,
                  child: RichText(
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: "Cupertino",
                        letterSpacing: 0,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign up",
                          style: TextStyle(
                            color: Color.fromRGBO(203, 124, 229, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // logos
                Positioned(
                  top: 660,
                  left: 150,
                  //right: 0,
                  child: Image.file(
                    key: Key("AppleLogoKey"),
                    File("/Users/mahamimran/project/assets/googlelogo.png"),
                  ),
                ),
                Positioned(
                  top: 660,
                  left: 50,
                  //right: 0,
                  child: Image.file(
                    key: Key("GoogleLogoKey"),
                    File("/Users/mahamimran/project/assets/applelogo.png"),
                  ),
                ),
                Positioned(
                  top: 660,
                  left: 250,
                  //right: 0,
                  child: Image.file(
                    key: Key("FacebookLogoKey"),
                    File("/Users/mahamimran/project/assets/facebooklogo.png"),
                  ),
                ),

                // add more code here:

                Container(),
                // stack requires empty non positioned widget to work properly.
              ],
            ),
          ),
        );
      }),
      debugShowCheckedModeBanner: false,
    );
  }
}

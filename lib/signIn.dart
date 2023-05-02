// ignore_for_file: use_key_in_widget_constructors, unnecessary_import, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, file_names
import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:project/home.dart';
import 'package:project/signUp.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // username and password input controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // sign in button pressed
  bool _isSignInPressed = false;
  bool _isSignUpPressed = false;
  bool _hidePassword = true;
  bool _isEyeIconPressed = false;
  bool _userAuthentication = false;

  void authenticateUser() {
    if (nameController.text == "mahamimran" && passwordController.text == "12345678") {
      _userAuthentication = true;
      print("user authenticated");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      print("invalid username or password");
    }
  }

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
                  top: MediaQuery.of(context).size.height * 0.165,
                  left: 0,
                  right: 0,
                  child: Text(
                    "Welcome back!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.075,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                  ),
                ),

                // "you've been missed"
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.21,
                  left: 0,
                  right: 0,
                  child: Text(
                    "you've been missed.",
                    key: Key("you'vebeenmissedkey"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                  ),
                ),

                // username dabba
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.005,
                  right: MediaQuery.of(context).size.width * 0.005,
                  top: MediaQuery.of(context).size.height * 0.334,
                  child: Container(
                    key: Key("usernamedabba"),
                    // dabba dimentions
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.068,
                    decoration: BoxDecoration(
                      color: Color(0xff393c41),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter username',
                        contentPadding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.04,
                            bottom: MediaQuery.of(context).size.width * 0.035,
                            top: MediaQuery.of(context).size.width * 0.053,
                            right: MediaQuery.of(context).size.width * 0.03),
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      // input white
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),

                // password dabba
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.005,
                  right: MediaQuery.of(context).size.width * 0.005,
                  top: MediaQuery.of(context).size.height * 0.427,
                  child: Container(
                    key: Key("passworddabba"),
                    // dabba dimentions
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.068,
                    decoration: BoxDecoration(
                      color: Color(0xff393c41),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      obscureText: _hidePassword,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Password',
                        contentPadding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.04,
                            bottom: MediaQuery.of(context).size.width * 0.035,
                            top: MediaQuery.of(context).size.width * 0.053,
                            right: MediaQuery.of(context).size.width * 0.03),
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      // input white
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),

                // eye icon
                Positioned(
                  // placement
                  top: MediaQuery.of(context).size.height * 0.45,
                  left: MediaQuery.of(context).size.width * 0.86,
                  // dimensions
                  width: MediaQuery.of(context).size.width * 0.05,
                  height: MediaQuery.of(context).size.height * 0.03,
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // ignore: avoid_print
                          print("Eye icon pressed");
                          setState(() {
                            _isEyeIconPressed = !_isEyeIconPressed;
                            _hidePassword = !_hidePassword;
                          });
                        },
                        child: Image.asset(
                          _isEyeIconPressed
                              ? '/Users/mahamimran/project/assets/openeyeicon.png'
                              : '/Users/mahamimran/project/assets/eyeicon.png',
                          key: Key('eyeIconKey'),
                          width: MediaQuery.of(context).size.width * 0.05,
                          height: MediaQuery.of(context).size.height * 0.05,
                          color: _isEyeIconPressed
                              ? Color.fromRGBO(203, 124, 229, 1)
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),

                // sign in button
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.02,
                  right: MediaQuery.of(context).size.width * 0.02,
                  top: MediaQuery.of(context).size.height * 0.555,
                  child: GestureDetector(
                    onTapDown: (_) => setState(() => _isSignInPressed = true),
                    onTapUp: (_) => setState(() => _isSignInPressed = false),
                    onTapCancel: () => setState(() => _isSignInPressed = false),
                    onTap: () {
                      // ignore: avoid_print
                      print("Sign in button pressed");
                      if (_userAuthentication==true){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: _isSignInPressed
                                ? Colors.white
                                : Color(0x3d9471cf),
                            offset: Offset(0, 4),
                            blurRadius: _isSignInPressed ? 24 : 16,
                          ),
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: _isSignInPressed
                              ? [
                                  Color(0xff6e54f7),
                                  Color(0xffc847f4),
                                ]
                              : [
                                  Color(0xffc847f4),
                                  Color(0xff6e54f7),
                                ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontFamily: "Cupertino",
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                  ),
                ),

                // lines
                Positioned(
                  left: 0,
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.737,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.67,
                    height: MediaQuery.of(context).size.height * 0.025,
                    padding: EdgeInsets.symmetric(),
                    child: Row(
                      key: Key("LinesKey"),
                      children: [
                        Container(
                          key: Key("Line1Key"),
                          width: MediaQuery.of(context).size.width * 0.3,
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
                          width: MediaQuery.of(context).size.width * 0.15,
                        ),
                        Container(
                          key: Key("Line2Key"),
                          width: MediaQuery.of(context).size.width * 0.3,
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
                  top: MediaQuery.of(context).size.height * 0.74,
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

                // "dont have an account? sign up
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.93,
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
                            decoration: _isSignUpPressed
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            // Add a glow effect
                            shadows: _isSignUpPressed
                                ? [
                                    BoxShadow(
                                      color: Color.fromRGBO(203, 124, 229, 0.8),
                                      blurRadius: 16,
                                      spreadRadius: 4,
                                    ),
                                  ]
                                : [],
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTapDown = (_) {
                              setState(() {
                                _isSignUpPressed = true;
                              });
                            }
                            ..onTapUp = (_) {
                              setState(() {
                                _isSignUpPressed = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()),
                              );
                            }
                            ..onTapCancel = () {
                              setState(() {
                                _isSignUpPressed = false;
                              });
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // logos
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.83, // adjust as needed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          key: Key("LogosKey"),
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              '/Users/mahamimran/project/assets/applelogo.png',
                            ),
                            Image.asset(
                              '/Users/mahamimran/project/assets/googlelogo.png',
                            ),
                            Image.asset(
                              '/Users/mahamimran/project/assets/facebooklogo.png',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                 // Forgot Password?
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.67,
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.51,
                  child: Text(
                    "Forgot Password?",
                    key: Key("forgotpasswordkey"),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                   
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

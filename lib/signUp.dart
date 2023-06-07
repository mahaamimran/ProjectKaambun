// ignore_for_file: use_key_in_widget_constructors, unnecessary_import, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, file_names
import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:project/home.dart';
import 'package:project/signIn.dart';
import 'package:project/welcome.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // username and password input controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // sign in button pressed
  bool _isSignInPressed = false;
  bool _isSignUpPressed = false;
  bool _hidePassword = true;
  bool _isEyeIconPressed = false;
  
void authenticateUser(BuildContext context) {
  RegExp passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  String message = "";

  if (passwordController.text.isEmpty) {
    message = "Please enter a password.";
  } else if (passwordController.text.length < 8) {
    message = "Password must be at least 8 characters long.";
  } else if (!RegExp(r'[A-Z]').hasMatch(passwordController.text)) {
    message = "Password must contain at least one uppercase letter.";
  } else if (!RegExp(r'[a-z]').hasMatch(passwordController.text)) {
    message = "Password must contain at least one lowercase letter.";
  } else if (!RegExp(r'[0-9]').hasMatch(passwordController.text)) {
    message = "Password must contain at least one digit.";
  } else if (!RegExp(r'[!@#\$&*~]').hasMatch(passwordController.text)) {
    message = "Password must contain at least one special character (!@#\$&*~).";
  }

  if (message.isNotEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
      ),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage()),
    );
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
                // "Hi There!"
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.165,
                  left: 0,
                  right: 0,
                  child: Text(
                    "Hi there!",
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

                // "welcome to kaamBun"
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.21,
                  left: 0,
                  right: 0,
                  child: Text(
                    "welcome to kaamBun",
                    key: Key("welcometokaambunkey"),
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
                        hintText: 'Create a username',
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
                        hintText: 'Create a Password',
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
                              ? 'assets/openeyeicon.png'
                              : 'assets/eyeicon.png',
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
                      print("Sign Up button pressed");
                      print(nameController.text);
                      print(passwordController.text);
                      authenticateUser(context);
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
                          "Sign up",
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

                // "Already have an account? Log in"
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.93,
                  left: 0,
                  right: 0,
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: "Cupertino",
                        letterSpacing: 0,
                      ),
                      children: [
                        TextSpan(
                          text: "Log in",
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
                                    builder: (context) => SignInPage()),
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
                              'assets/applelogo.png',
                            ),
                            Image.asset(
                              'assets/googlelogo.png',
                            ),
                            Image.asset(
                              'assets/facebooklogo.png',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // By signing up you agree to Terms & Conditions
                Positioned(
                  left: 0,
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.64,
                  child: Text(
                    "By signing up you agree to Terms & Conditions",
                    key: Key("t&ckey"),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                    textAlign: TextAlign.center,
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

// ignore_for_file: use_key_in_widget_constructors, unnecessary_import, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, file_names, unused_import
import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'home.dart';
import 'AppSkeleton.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (BuildContext context) {
        return Scaffold(
          body: Container(
            // background color
            color: Color(0xff212327),
            // padding around borders
            padding: EdgeInsets.all(20.0),
            child: Stack(
              children: [
                // welcome!
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.12, // diff of 25
                  left: 0,
                  right: 0,
                  child: Text(
                    "Welcome!",
                    key: Key("welcomeKey"),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.037,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                  ),
                ),

                // set kaamBun to achieve
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.16,
                  left: 0,
                  right: 0,
                  child: RichText(
                    text: TextSpan(
                      text: "Set ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.035,
                        fontFamily: "Cupertino",
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: "kaamBun ",
                          style: TextStyle(
                            color: Color.fromRGBO(203, 124, 229, 1),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text: "to achieve your goals and dreams",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),

                // image
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.27,
                  left: 0,
                  right: 0,
                  child: Image.file(
                    key: Key("sunsetKey"),
                    File("/Users/mahamimran/project/assets/sunset.png"),
                    scale: 0.5,
                    alignment: Alignment.center,
                  ),
                ),

                // dabba1
                Positioned(
                  left: 0,
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.65,
                  child: Column(
                    children: [
                      Container(
                        key: Key("dabba1Key"),
                        // dabba dimentions
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.066,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(77, 77, 77, 0.9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // add home screen here
                          print('wake clicked');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // dabba1text
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.672,
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        "I want to wake up on time",
                        key: Key("dabba1textKey"),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.042,
                          fontFamily: "Cupertino",
                          letterSpacing: 0,
                        ),
                      ),
                       GestureDetector(
                        onTap: () {
                          print('wake text');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // dabba2
                Positioned(
                  left: 0,
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.73,
                  child: Column(
                    children: [
                      Container(
                        key: Key("dabba2Key"),
                        // dabba dimentions
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.066,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(77, 77, 77, 0.9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // add home screen here
                          print('organised clicked');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // dabba2text
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.752,
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        "I want to be more organised",
                        key: Key("dabba2textKey"),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.042,
                          fontFamily: "Cupertino",
                          letterSpacing: 0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('organised text');
                        },
                      ),
                    ],
                  ),
                ),

                // dabba3
                Positioned(
                  left: 0,
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.81,
                  child: Column(
                    children: [
                      Container(
                        key: Key("dabba3Key"),
                        // dabba dimentions
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.066,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(77, 77, 77, 0.9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // add home screen here
                          print('productive clicked');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // dabba3text
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.831,
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        "I want to be more productive",
                        key: Key("dabba3textKey"),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.042,
                          fontFamily: "Cupertino",
                          letterSpacing: 0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('productive text clicked');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),

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

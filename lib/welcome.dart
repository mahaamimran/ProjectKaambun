// ignore_for_file: use_key_in_widget_constructors, unnecessary_import, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, file_names, unused_import
import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

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
                  top: 110, // diff of 25
                  left: 0,
                  right: 0,
                  child: Text(
                    "Welcome!",
                    key: Key("welcomeKey"),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                  ),
                ),

                // set kaamBun to achieve
                Positioned(
                  top: 175-25,
                  left: 0,
                  right: 0,
                  child: RichText(
                    text: TextSpan(
                      text: "Set ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
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
                  top: 277-25,
                  left: 0,
                  right: 0,
                  child: Image.file(
                    key: Key("sunsetKey"),
                    File("/Users/mahamimran/project/assets/sunset.png"),
                    scale: 1,
                    alignment: Alignment.center,
                  ),
                ),

                // dabba1
                Positioned(
                  left: 0,
                  right: 0,
                  top: 580-25,
                  child: Container(
                    key: Key("dabba1Key"),
                    // dabba dimentions
                    width: 343,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(77, 77, 77, 0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // dabba1text
                Positioned(
                  top: 597-25,
                  left: 20,
                  right: 0,
                  child: Text(
                    "I want to wake up on time",
                    key: Key("dabba1textKey"),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                  ),
                ),

                // arrow 1
                Positioned(
                  top: 602-25,
                  left: 320,
                  // right: 0,
                  child: Image.file(
                    key: Key("arrow1Key"),
                    File("/Users/mahamimran/project/assets/rightarrow.png"),
                  ),
                ),

                // dabba2
                Positioned(
                  left: 0,
                  right: 0,
                  top: 650-25,
                  child: Container(
                    key: Key("dabba2Key"),
                    // dabba dimentions
                    width: 343,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(77, 77, 77, 0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // dabba2text
                Positioned(
                  top: 667-25,
                  left: 20,
                  right: 0,
                  child: Text(
                    "I want to be more organised",
                    key: Key("dabba2textKey"),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                  ),
                ),

                // arrow 2
                Positioned(
                  top: 672-25,
                  left: 320,
                  // right: 0,
                  child: Image.file(
                    key: Key("arrow2Key"),
                    File("/Users/mahamimran/project/assets/rightarrow.png"),
                  ),
                ),

                // dabba3
                Positioned(
                  left: 0,
                  right: 0,
                  top: 720-25,
                  child: Container(
                    key: Key("dabba3Key"),
                    // dabba dimentions
                    width: 343,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(77, 77, 77, 0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // dabba3text
                Positioned(
                  top: 737-25,
                  left: 20,
                  right: 0,
                  child: Text(
                    "I want to be more productive",
                    key: Key("dabba3textKey"),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                  ),
                ),

                // arrow 3
                Positioned(
                  top: 742-25,
                  left: 320,
                  // right: 0,
                  child: Image.file(
                    key: Key("arrow3Key"),
                    File("/Users/mahamimran/project/assets/rightarrow.png"),
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

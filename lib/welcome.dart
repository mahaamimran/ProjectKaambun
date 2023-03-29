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
                  top: 135,
                  left: 0,
                  right: 0,
                  child: Text(
                    "Welcome!",
                    key: Key("welcomeKey"),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                  ),
                ),

                // set kaamBun to achieve
                Positioned(
                  top: 175,
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
                  top: 350,
                  left: 0,
                  right: 0,
                  child: Image.file(
                    key: Key("sunsetKey"),
                    File("/Users/mahamimran/project/assets/sunset.png"),
                    width: 426,
                    height: 321,
                    alignment: Alignment.center,
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

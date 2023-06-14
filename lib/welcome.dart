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
          backgroundColor: const Color(0xff212327),
          body: Container(
            // padding around borders
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.038),
            child: Column(
              children: [
                // sized box to push text down
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                // welcome set kaambun text
                RichText(
                  text: TextSpan(
                    text: "Welcome!\n",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.037,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                    children: [
                      TextSpan(
                        text: "Set ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.035,
                          fontFamily: "Cupertino",
                          letterSpacing: 0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "kaamBun",
                        style: TextStyle(
                          color: Color.fromRGBO(203, 124, 229, 1),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextSpan(
                        text: " to achieve your goals and dreams",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.035,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                // sized box to push text down
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                // sunset picture 🥰
                Image.asset(
                  "assets/sunset.png",
                  fit: BoxFit.cover,
                ),
                // sized box to push text down
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                // dabba 1
                GestureDetector(
                  onTap: () {
                    print("Container clicked");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                    // Display relevant message or perform desired action
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.066,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(77, 77, 77, 0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(19), // Add padding on all sides
                    child: Row(
                      children: [
                        // Your text widget goes here
                        Text(
                          "I want to wake up on time",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.042,
                            fontFamily: "Cupertino",
                            letterSpacing: 0,
                          ),
                        ),
                        // sized box to push text down
                      ],
                    ),
                  ),
                ),
                // sized box to push text down
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                // dabba 2
                GestureDetector(
                  onTap: () {
                    print("Container 2 clicked");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                    // Display relevant message or perform desired action
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.066,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(77, 77, 77, 0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(19), // Add padding on all sides
                    child: Row(
                      children: [
                        Text(
                          "I want to be more organized",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.042,
                            fontFamily: "Cupertino",
                            letterSpacing: 0,
                          ),
                        ),
                        // sized box to push text down
                      ],
                    ),
                  ),
                ),
                // sized box to push text down
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                // dabba 3
                GestureDetector(
                  onTap: () {
                    print("Container 3 clicked");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.066,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(77, 77, 77, 0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(19), // Add padding on all sides
                    child: Row(
                      children: [
                        // Your text widget goes here
                        Text(
                          "I want to be more productive",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.042,
                            fontFamily: "Cupertino",
                            letterSpacing: 0,
                          ),
                        ),
                        // sized box to push text down
                      ],
                    ),
                  ),
                ),
                // sized box to push text down
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              ],
            ),
          ),
        );
      }),
      debugShowCheckedModeBanner: false,
    );
  }
}

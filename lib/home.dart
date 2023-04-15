// ignore_for_file: use_key_in_widget_constructors, unnecessary_import, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, file_names, unused_import
import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (BuildContext context) {
        return Scaffold(
          // top bar
          appBar: AppBar(
            title: Text("Home"),
            backgroundColor: Color(0xff212327),
          ),

          body: Container(
            // background color
            color: Colors.white,
            // padding around borders
            padding: EdgeInsets.all(0),
            child: Stack(
              children: [
                Positioned(
                  top: 300,
                  left: 0,
                  right: 0,
                  child: Text(
                    "hello",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // navigation bar
                Positioned(
                  left: 0,
                  right: 0,
                  top: 650,
                  bottom: 0,
                  child: Container(
                    key: Key("navigationbarKey"),
                    // navigationbar
                    width: null,
                    height: null,
                    decoration: BoxDecoration(
                      color: Color(0xff212327),
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),

                // navigation bar items
                
                // home logo
                Positioned(
                  top: 675,
                  left: 50,
                  child: Image.file(
                    key: Key("item1"),
                    File("/Users/mahamimran/project/assets/Navigation Bar/homepurple.png"),
                  ),
                ),

                Positioned(
                  top: 675,
                  left: 140,
                  child: Image.file(
                    key: Key("item2"),
                    File("/Users/mahamimran/project/assets/Navigation Bar/goalswhite.png"),
                  ),
                ),

                Positioned(
                  top: 675,
                  right: 140,
                  child: Image.file(
                    key: Key("item3"),
                    File("/Users/mahamimran/project/assets/Navigation Bar/taskalarmswhite.png"),
                  ),
                ),

                Positioned(
                  top: 675,
                  right: 50,
                  child: Image.file(
                    key: Key("item4"),
                    File("/Users/mahamimran/project/assets/Navigation Bar/profilewhite.png"),
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
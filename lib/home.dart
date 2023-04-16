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
  bool _HomeIconClicked = true;
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

                // bottom bar
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: BottomNavigationBar(
                    backgroundColor: Color(0xff212327),
                    type: BottomNavigationBarType.fixed,
                    currentIndex: currentIndex,
                    onTap: (int index) {
                      setState(() {
                        currentIndex = index;
                        if (currentIndex == 0) {
                          _HomeIconClicked = true;
                        } else {
                          _HomeIconClicked = false;
                        }
                      });
                    },
                    selectedItemColor: Color(0xff6e54f7),
                    unselectedItemColor: Colors.white,
                    items: [
                      BottomNavigationBarItem(
                        icon: Image.asset(
                            color: _HomeIconClicked
                                ? Color(0xff6e54f7)
                                : Colors.white,
                            '/Users/mahamimran/project/assets/eyeicon.png',
                            width: 20,
                            height: 20),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        label: "Search",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.add),
                        label: "Add",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: "Profile",
                      ),
                    ],
                  ),
                ),

                // navigation bar items

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

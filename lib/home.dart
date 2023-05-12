// ignore_for_file: use_key_in_widget_constructors, unnecessary_import, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, file_names, unused_import
import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project/home.dart';
import 'AddTaskPage.dart';
import 'ScheduledTasks.dart';
import 'SettingsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (BuildContext context) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                // background color
                color: Color(0xff212327),

                child: Stack(
                  children: [
                    // scrollable stuff
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                        vertical: 0
                        ),
                      child: ListView(
                        children: [
                          // motvational quote container
                          Container(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Highlights",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                // space bewteen text and container
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.012,
                                ),
                                Text(
                                  "today is not your day. try again tomorrow.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.045,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.005,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "- Maham",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // padding for container
                            height: MediaQuery.of(context).size.height * 0.17,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
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

                          // space between highlights & goal tracking
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015),

                          // goal tracking
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  '/Users/mahamimran/project/assets/goaltracking.png'),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                "My Stats",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.06,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          // space
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),

                          // container for goal tracking
                          Container(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.05),
                            height: MediaQuery.of(context).size.height * 0.34,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(57, 111, 113, 135),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Today",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 189, 123, 210),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "05:30 AM",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 189, 123, 210),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // sized box
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Alarm",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          "06:30 AM",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Snoozed",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 189, 123, 210),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          "25 times",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 189, 123, 210),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    //add more code
                                  ],
                                ),

                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),

                                // graph
                                Transform.scale(
                                  scale: MediaQuery.of(context).size.width *
                                      0.0029,
                                  child: Image.asset(
                                    '/Users/mahamimran/project/assets/graph.png',
                                    height: MediaQuery.of(context).size.height *
                                        0.19,
                                  ),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sun",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.04,
                                    ),
                                    Text(
                                      "Mon",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.04,
                                    ),
                                    Text(
                                      "Tue",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.04,
                                    ),
                                    Text(
                                      "Wed",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.04,
                                    ),
                                    Text(
                                      "Thu",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.04,
                                    ),
                                    Text(
                                      "Fri",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.04,
                                    ),
                                    Text(
                                      "Sat",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                //  Text('Child 2'),
                                // Text('Child 3'),
                              ],
                            ),
                          ),

                          // space between graph and workout box
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),

                          // workout box
                          Center(
                            child: Container(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.05),
                              height: MediaQuery.of(context).size.height * 0.09,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 199, 120, 226),
                                    Color.fromARGB(255, 143, 127, 228),
                                  ],
                                ),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    '/Users/mahamimran/project/assets/workoutsparkle.png', // Replace with the path to your image file
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                                  Text(
                                    "Workout",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.5),
                                  Image.asset(
                                    '/Users/mahamimran/project/assets/rightarrow.png',
                                   
                                        scale: MediaQuery.of(context).size.width * 0.0018,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // add more code here:
                          //Text("hello"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
      debugShowCheckedModeBanner: false,
    );
  }
}

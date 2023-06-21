// ignore_for_file: use_key_in_widget_constructors, unnecessary_import, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, file_names, unused_import
import 'dart:ui';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project/home.dart';
import 'AddTaskPage.dart';
import 'ScheduledTasks.dart';
import 'SettingsPage.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});
  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  bool isContainerClicked = false;
  List<String> quotes = [
    "Until we can manage time, we can manage nothing else",
    "Time is what we want most, but what we use worst",
    "Lost time is never found again",
  ];
  List<String> names = [
    "- Peter Drucker",
    "- William Penn",
    "- Benjamin Franklin",
  ];
  int randomIndex = 0;
  List<String> randomParts = [
    "something random part 1 🕺🏻",
    "something random part 2 💃🏻",
    "something random part 3 🕺🏻",
    "something random part 4 💃🏻",
    "something random part 5 🕺🏻",
    "something random part 6 💃🏻",
  ];
  @override
  void initState() {
    super.initState();
    refreshRandomIndex();
  }

  void refreshRandomIndex() {
    setState(() {
      randomIndex = Random().nextInt(quotes.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: const Color(0xff212327),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.height * 0.01),
            child: ListView(
              children: [
                // motvational quote container
                Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Highlights",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          quotes[randomIndex],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            names[randomIndex],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                // goal tracking
                Row(
                  children: [
                    Image.asset('assets/goaltracking.png'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Text(
                      "My Stats",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                // space
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
// container for goal tracking
                Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
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
                                  color: Color.fromARGB(255, 189, 123, 210),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "05:30 AM",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 189, 123, 210),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          // sized box
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Column(
                            children: [
                              Text(
                                "Alarm",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "06:30 AM",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Column(
                            children: [
                              Text(
                                "Snoozed",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 189, 123, 210),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "25 times",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 189, 123, 210),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          //add more code
                        ],
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),

                      // graph
                      Transform.scale(
                        scale: MediaQuery.of(context).size.width * 0.0029,
                        child: Image.asset(
                          'assets/graph.png',
                          height: MediaQuery.of(context).size.height * 0.19,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(7, (index) {
                          final day = [
                            "Sun",
                            "Mon",
                            "Tue",
                            "Wed",
                            "Thu",
                            "Fri",
                            "Sat"
                          ][index];
                          return Padding(
                            padding: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.width * 0.04),
                            child: Text(
                              day,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),

                // space between graph and workout box
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

                // workout box
                Center(
                  child: GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        // Update the state variable to indicate the container is clicked
                        isContainerClicked = true;
                      });
                    },
                    onTapUp: (TapUpDetails details) {
                      setState(() {
                        // Update the state variable to indicate the container is released
                        isContainerClicked = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.05),
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: isContainerClicked
                              ? [
                                  Color.fromARGB(255, 143, 127, 228),
                                  Color.fromARGB(255, 199, 120, 226),
                                ]
                              : [
                                  Color.fromARGB(255, 199, 120, 226),
                                  Color.fromARGB(255, 143, 127, 228),
                                ],
                        ),
                        boxShadow: isContainerClicked
                            ? [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ]
                            : [],
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/workoutsparkle.png', // Replace with the path to your image file
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04),
                          Text(
                            "Workout",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3),
                          Image.asset(
                            'assets/rightarrow.png',
                            scale: MediaQuery.of(context).size.width * 0.0018,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                for (String part in randomParts)
                  Column(
                    children: [
                      Text(
                        part,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      }),
      debugShowCheckedModeBanner: false,
    );
  }
}

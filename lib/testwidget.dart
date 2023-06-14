// ignore_for_file:  prefer_const_literals_to_create_immutables, file_names, library_private_types_in_public_api, avoid_print
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project/Hours.dart';
import 'package:project/Minutes.dart';

class TaskData {
  final String taskName;
  final String subTaskName;
  final int currentHour;
  final int currentMinute;
  final String currentAmPm;
  final double sliderValue;

  TaskData({
    required this.taskName,
    required this.subTaskName,
    required this.currentHour,
    required this.currentMinute,
    required this.currentAmPm,
    required this.sliderValue,
  });
}

class CustomButton extends StatefulWidget {
  final String weekday;

  const CustomButton(this.weekday, {super.key});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.width * 0.09,
        width: MediaQuery.of(context).size.width * 0.125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: isPressed
              ? const LinearGradient(
                  colors: [
                    Color.fromRGBO(77, 77, 77, 0.9),
                    Color.fromRGBO(77, 77, 77, 0.9),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.0, 1.0],
                )
              : const LinearGradient(
                  colors: [
                    Color(0xff6e54f7),
                    Color(0xffc847f4),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.0, 1.0],
                ),
        ),
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
        child: Center(
          child: Text(
            widget.weekday,
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.037,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class TestWidget extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const TestWidget({Key? key});

  @override
  State<TestWidget> createState() => _TestWidgetState();

  void onSave() {}
}

class _TestWidgetState extends State<TestWidget> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController subTaskNameController = TextEditingController();
  int currentHour = 1;
  int currentMinute = 0;
  String currentAmPm = "AM";
  double sliderValue = 0.0;
  bool isEditing = false;
  Color penColor = Colors.white;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<int> hoursList = List<int>.generate(12, (index) => index + 1);
  List<int> minutesList = List<int>.generate(60, (index) => index);

  // snackbar
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xff212327),
      body: Column(
        children: [
          // add more
          Row(
            children: [
              // task name
              Expanded(
                child: TextField(
                  controller: taskNameController,
                  enabled: isEditing,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Task Name',
                    contentPadding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04,
                      bottom: MediaQuery.of(context).size.width * 0.01,
                      top: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.03,
                    ),
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Cupertino",
                    letterSpacing: 0,
                  ),
                ),
              ),

              // toggles color of pen icon
              GestureDetector(
                onTap: () {
                  setState(() {
                    isEditing = !isEditing;
                    penColor = isEditing
                        ? const Color.fromRGBO(203, 124, 229, 1)
                        : Colors.white;
                  });
                  isEditing
                      ? _showSnackBar("Editing Enabled")
                      : _showSnackBar("Editing Disabled");
                },
                child: Image.asset(
                  'assets/editpen.png',
                  color: penColor,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          // scrollable list for alarm
          Expanded(
            child: ListWheelScrollView(
              itemExtent: 50, // Height of each item
              children: [
                // List of items within the scroll view
                Text(
                  'Item 1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Cupertino",
                    letterSpacing: 0,
                  ),
                ),
                Text(
                  'Item 1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Cupertino",
                    letterSpacing: 0,
                  ),
                ),
                Text(
                  'Item 1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Cupertino",
                    letterSpacing: 0,
                  ),
                ),
                // Add more items as needed
              ],
            ),
          ),

          // alarm ke neechay
          Expanded(
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // repeat making it left
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Text(
                        "Repeat",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  // space between repeat and weekdays
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                  // weekdays
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var weekday in [
                        'Mon',
                        'Tue',
                        'Wed',
                        'Thu',
                        'Fri',
                        'Sat',
                        'Sun'
                      ])
                        CustomButton(weekday),
                    ],
                  ),

                  // space between weekdays and subtasks
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  // subtasks
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Text(
                        "Sub tasks",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  // none
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: subTaskNameController,
                          enabled: isEditing,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'None',
                            contentPadding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.02,
                              right: MediaQuery.of(context).size.width * 0.02,
                              top: MediaQuery.of(context).size.width * 0.02,
                              bottom: MediaQuery.of(context).size.width * 0.02,
                            ),
                            hintStyle: TextStyle(
                              color: isEditing ? Colors.white : Colors.grey,
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Cupertino",
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/rightarrow.png",
                        width: MediaQuery.of(context).size.width * 0.07,
                        scale: 0.7,
                      ),
                    ],
                  ),

                  // length of task
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Text(
                        "Length of task",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  // add slider here for length of task
                  Slider(
                    value: sliderValue,
                    min: 0.0,
                    max: 100.0,
                    onChanged: (newValue) {
                      setState(() {
                        sliderValue = newValue;
                      });
                    },
                    activeColor: const Color(0xffc847f4),
                    thumbColor: Colors.white,
                    inactiveColor: const Color.fromRGBO(77, 77, 77, 0.9),
                  ),
                  // time
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width *
                              0.04), // Adjust the left padding as needed
                      child: Text(
                        sliderValue.round() >= 60
                            ? '${(sliderValue.round() ~/ 60).toString()} hours ${(sliderValue.round() % 60).toString()} minutes'
                            : '${sliderValue.round().toString()} minutes',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  // add more code here
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.25,
          ),
        ],
      ),
    );
  }
}

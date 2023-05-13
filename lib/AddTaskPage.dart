// ignore: file_names
// ignore_for_file: file_names, prefer_const_literals_to_create_immutables
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/Hours.dart';
import 'package:project/Minutes.dart';

class CustomButton extends StatefulWidget {
  final String weekday;

  CustomButton(this.weekday);

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
              ? LinearGradient(
                  colors: [
                    Color.fromRGBO(77, 77, 77, 0.9),
                    Color.fromRGBO(77, 77, 77, 0.9),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.0, 1.0],
                )
              : LinearGradient(
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

class AddTaskPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const AddTaskPage({Key? key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController taskNameController = TextEditingController();
  bool isEditing = false;
  Color penColor = Colors.white;
  int currentHour = 1;
  int currentMinute = 0;
  String currentAmPm = "AM";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // snackbar
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff212327),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            child: Row(
              children: [
                // Task Name
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
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Cupertino",
                      letterSpacing: 0,
                    ),
                  ),
                ),

                // clicking on the pen icon will enable editing
                // toggles color of pen icon
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isEditing = !isEditing;
                      penColor = isEditing
                          ? Color.fromRGBO(203, 124, 229, 1)
                          : Colors.white;
                    });
                    print("edit clicked");
                    print(isEditing);
                  },
                  child: Image.asset(
                    '/Users/mahamimran/project/assets/editpen.png',
                    color: penColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.13,
                  vertical: MediaQuery.of(context).size.width * 0.14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListWheelScrollView.useDelegate(
                      onSelectedItemChanged: (value) {
                        setState(() {
                          currentHour =
                              value + 1; // Add 1 to start from 1 instead of 0
                        });
                        print(currentHour);
                        // ADD VALIDATION HERE
                      },
                      itemExtent: MediaQuery.of(context).size.width * 0.1,
                      perspective: 0.00005,
                      diameterRatio: MediaQuery.of(context).size.width * 0.002,
                      physics: FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 12, // Update the childCount to 12
                        builder: (context, index) {
                          final hour =
                              index + 1; // Add 1 to start from 1 instead of 0
                          return Transform.scale(
                            scale: currentHour == hour ? 1.5 : 0.6,
                            child: Opacity(
                              opacity: currentHour == hour ? 1.0 : 0.3,
                              child: Hours(hour: hour),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListWheelScrollView.useDelegate(
                      onSelectedItemChanged: (value) {
                        setState(() {
                          currentMinute = value;
                        });
                        print(currentMinute);
                      },
                      itemExtent: MediaQuery.of(context).size.width * 0.1,
                      perspective: 0.00005,
                      diameterRatio: MediaQuery.of(context).size.width * 0.002,
                      physics: FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 60,
                        builder: (context, index) {
                          return Transform.scale(
                            scale: currentMinute == index ? 1.5 : 0.6,
                            child: Opacity(
                              opacity: currentMinute == index ? 1.0 : 0.3,
                              child: Minutes(mins: index),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListWheelScrollView(
                      onSelectedItemChanged: (value) {
                        setState(() {
                          if (value == 0) {
                            currentAmPm = "AM";
                          } else {
                            currentAmPm = "PM";
                          }
                        });
                        print(currentAmPm);
                      },
                      itemExtent: MediaQuery.of(context).size.width * 0.1,
                      perspective: 0.00005,
                      diameterRatio: MediaQuery.of(context).size.width * 0.002,
                      physics: FixedExtentScrollPhysics(),
                      children: [
                        Transform.scale(
                          scale: currentAmPm == "AM" ? 1.5 : 0.6,
                          child: Opacity(
                            opacity: currentAmPm == "AM" ? 1.0 : 0.4,
                            child: Container(
                              child: Center(
                                child: Text(
                                  "AM",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.07,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Transform.scale(
                          scale: currentAmPm == "PM" ? 1.0 : 0.5,
                          child: Opacity(
                            opacity: currentAmPm == "PM" ? 1.0 : 0.4,
                            child: Container(
                              child: Center(
                                child: Text(
                                  "PM",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.07,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.001),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // repeat making it left
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
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
                    height: MediaQuery.of(context).size.width * 0.02,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

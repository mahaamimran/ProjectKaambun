// ignore_for_file:  prefer_const_literals_to_create_immutables, file_names, library_private_types_in_public_api, avoid_print
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

class AddTaskPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const AddTaskPage({Key? key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();

  void onSave() {}
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController subTaskNameController = TextEditingController();
  int currentHour = 1;
  int currentMinute = 0;
  String currentAmPm = "AM";
  double sliderValue = 0.0;
  bool isEditing = false;
  bool isAlarmEnabled = false;
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
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.035),
        child: Column(
          children: [
            Expanded(
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

                  // clicking on the pen icon will enable editing
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
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            // items
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.09),
                child: Row(
                  children: [
                    Expanded(
                      child: ListWheelScrollView.useDelegate(
                        onSelectedItemChanged: (value) {
                          setState(() {
                            currentHour = hoursList[value];
                          });
                          print(currentHour);
                          // ADD VALIDATION HERE
                        },
                        itemExtent: MediaQuery.of(context).size.width * 0.1,
                        perspective: 0.005,
                        diameterRatio: 1.5,
                        physics: const FixedExtentScrollPhysics(),
                        childDelegate: ListWheelChildLoopingListDelegate(
                          children: hoursList.map((hour) {
                            return Transform.scale(
                              scale: currentHour == hour ? 1.5 : 0.6,
                              child: Opacity(
                                opacity: currentHour == hour ? 1.0 : 0.3,
                                child: Hours(hour: hour),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    // minutes
                    Expanded(
                      child: ListWheelScrollView.useDelegate(
                        onSelectedItemChanged: (value) {
                          setState(() {
                            currentMinute = value;
                          });
                          print(currentMinute);
                        },
                        itemExtent: MediaQuery.of(context).size.width * 0.1,
                        perspective: 0.005,
                        diameterRatio: 1.5,
                        physics: const FixedExtentScrollPhysics(),
                        childDelegate: ListWheelChildLoopingListDelegate(
                          children: minutesList.map((minute) {
                            return Transform.scale(
                              scale: currentMinute == minute ? 1.5 : 0.6,
                              child: Opacity(
                                opacity: currentMinute == minute ? 1.0 : 0.3,
                                child: Minutes(mins: minute),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    // AM/PM
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
                        diameterRatio:
                            MediaQuery.of(context).size.width * 0.002,
                        physics: const FixedExtentScrollPhysics(),
                        children: [
                          Transform.scale(
                            scale: currentAmPm == "AM" ? 1.5 : 0.6,
                            child: Opacity(
                              opacity: currentAmPm == "AM" ? 1.0 : 0.4,
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
                          Transform.scale(
                            scale: currentAmPm == "PM" ? 1.5 : 0.6,
                            child: Opacity(
                              opacity: currentAmPm == "PM" ? 1.0 : 0.4,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Repeat",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            // weekdays
            Expanded(
              child: // weekdays
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
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sub tasks",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            // subtask editable
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: subTaskNameController,
                      enabled: isEditing,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'None',
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
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Length of task",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Expanded(
              child: // add slider here for length of task
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
            ),
            Expanded(
              child: Align(
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
            ),

            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Alarm",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Switch(
                    value: isAlarmEnabled,
                    activeColor:const Color.fromRGBO(203, 124, 229, 1), // Customize the active color of the switch
                    inactiveThumbColor: Colors
                        .grey, // Customize the inactive thumb color of the switch
                    inactiveTrackColor: Colors.grey.withOpacity(0.5),

                    onChanged: (value) {
                      setState(() {
                        isAlarmEnabled = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

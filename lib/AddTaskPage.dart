import 'package:flutter/material.dart';
import 'package:project/Hours.dart';
import 'package:project/Minutes.dart';

class AddTaskPage extends StatefulWidget {
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
                            scale: currentHour == hour ? 1.0 : 0.5,
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
                            scale: currentMinute == index ? 1.0 : 0.5,
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
                          scale: currentAmPm == "AM" ? 1.0 : 0.9,
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
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "something random",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "something random",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "something random",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
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

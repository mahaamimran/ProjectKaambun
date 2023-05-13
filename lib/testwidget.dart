import 'package:flutter/material.dart';
import 'package:project/Hours.dart';
import 'package:project/Minutes.dart';
class TestWidget extends StatefulWidget {
  const TestWidget({Key? key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  TextEditingController taskNameController = TextEditingController();
  bool isEditing = false;
  Color penColor = Colors.white;
int currentHour = 0;
  int currentMinute = 0;
  String currentAmPm = "AM";
  FixedExtentScrollController hourScrollController = FixedExtentScrollController(initialItem: 6);
  FixedExtentScrollController minuteScrollController = FixedExtentScrollController(initialItem: 30);
  FixedExtentScrollController amPmScrollController = FixedExtentScrollController(initialItem: 0);
 bool validateSelectedTime() {
    // Get the current time
    final currentTime = DateTime.now();

    // Get the selected time from the ListWheelScrollView
    final selectedHour = currentHour % 12; // Convert to 12-hour format
    final selectedMinute = currentMinute;
    final selectedAmPm = currentAmPm;

    // Create a DateTime object with the selected time
    final selectedTime = DateTime(
      currentTime.year,
      currentTime.month,
      currentTime.day,
      selectedAmPm == "AM" ? selectedHour : selectedHour + 12,
      selectedMinute,
    );

    // Perform validation checks
    if (selectedHour < 1 || selectedHour > 12) {
      return false; // Invalid hour
    }
    if (selectedMinute < 0 || selectedMinute > 59) {
      return false; // Invalid minute
    }
    if (selectedTime.isBefore(currentTime)) {
      return false; // Selected time is in the past
    }

    return true; // Time is valid
  }
  @override
  void initState() {
    super.initState();

    hourScrollController.addListener(() {
      if (hourScrollController.position.atEdge) {
        if (hourScrollController.position.pixels == 0) {
          setState(() {
            hourScrollController.jumpToItem(hourScrollController.initialItem - 1);
          });
        } else {
          setState(() {
            hourScrollController.jumpToItem(0);
          });
        }
      }
    });

    minuteScrollController.addListener(() {
      if (minuteScrollController.position.atEdge) {
        if (minuteScrollController.position.pixels == 0) {
          setState(() {
            minuteScrollController.jumpToItem(minuteScrollController.initialItem - 1);
          });
        } else {
          setState(() {
            minuteScrollController.jumpToItem(0);
          });
        }
      }
    });

    amPmScrollController.addListener(() {
      if (amPmScrollController.position.atEdge) {
        if (amPmScrollController.position.pixels == 0) {
          setState(() {
            amPmScrollController.jumpToItem(amPmScrollController.initialItem - 1);
          });
        } else {
          setState(() {
            amPmScrollController.jumpToItem(0);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Rest of your build method

    return Scaffold(
      backgroundColor: Color(0xff212327),
      body: Column(
        children: [
          // Rest of your code

          Expanded(
            child: ListWheelScrollView.useDelegate(
              controller: hourScrollController,
              onSelectedItemChanged: (value) {
                        setState(() {
                          currentHour = value;
                        });
                        print(currentHour);
                        if (!validateSelectedTime()) {
                          print("Invalid time");  
                        }
                      },
                      itemExtent: MediaQuery.of(context).size.width * 0.1,
                      perspective: 0.01,
                      diameterRatio: MediaQuery.of(context).size.width * 0.002,
                      physics: FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 13,
                        builder: (context, index) {
                          return Transform.scale(
                            scale: currentHour == index ? 1.0 : 0.5,
                            child: Opacity(
                              opacity: currentHour == index ? 1.0 : 0.3,
                              child: Hours(hour: index),
                            ),
                          );
                        },
                      ),
            ),
          ),
          Expanded(
            child: ListWheelScrollView.useDelegate(
              controller: minuteScrollController,
              
              onSelectedItemChanged: (value) {
                        setState(() {
                          currentMinute = value;
                        });
                        print(currentMinute);
                      },
                      itemExtent: MediaQuery.of(context).size.width * 0.1,
                      perspective: 0.01,
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
              controller: amPmScrollController,
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
                      perspective: 0.01,
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

          // Rest of your code
        ],
      ),
    );
  }
}

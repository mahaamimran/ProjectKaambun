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
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            child: Row(
              children: [
              ],
            ),
          ),
        ],
      ),
    );
  }
}

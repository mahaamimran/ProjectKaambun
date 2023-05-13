import 'package:flutter/material.dart';
class Hours extends StatelessWidget {
  int hour;
  Hours({required this.hour});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          hour<10 ? "0"+hour.toString() :
          hour.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.1,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    );
  }
}
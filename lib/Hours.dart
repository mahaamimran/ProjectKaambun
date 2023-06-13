// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
class Hours extends StatelessWidget {
  int hour;
  Hours({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        hour<10 ? "0$hour" :
        hour.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.width * 0.1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
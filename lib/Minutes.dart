// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
class Minutes extends StatelessWidget {
  int mins;
  Minutes({super.key, required this.mins});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        mins<10 ? "0$mins" :
        mins.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.width * 0.1,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
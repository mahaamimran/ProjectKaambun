import 'package:flutter/material.dart';
class Minutes extends StatelessWidget {
  int mins;
  Minutes({required this.mins});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          mins<10 ? "0"+mins.toString() :
          mins.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.1,
            fontWeight: FontWeight.bold
          ),
        ),
      )
    );
  }
}
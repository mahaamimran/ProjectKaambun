// ignore_for_file: use_key_in_widget_constructors, unnecessary_import, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, file_names, unused_import
import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home.dart';
import 'AddTaskPage.dart';
import 'ScheduledTasks.dart';
import 'SettingsPage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppSkeleton(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppSkeleton extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AppSkeletonState createState() => _AppSkeletonState();
}

class _AppSkeletonState extends State<AppSkeleton> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    AddTaskPage(),
    ScheduledTasks(),
    SettingsPage(),
  ];

  final List<String> _appBarTitles = [
    "Home",
    "Add",
    "Tasks",
    "Settings",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appBarTitles[_selectedIndex], // Update the app bar title
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width * 0.055,
          ),
        ),
        backgroundColor: Color(0xff212327),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xff212327),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.004, 
            horizontal: MediaQuery.of(context).size.width * 0.03,
            ),
          child: GNav(
            gap: MediaQuery.of(context).size.width * 0.045,
            backgroundColor: Color(0xff212327),
            color: Colors.white,
            activeColor: Color.fromARGB(255, 189, 123, 210),
            iconSize: MediaQuery.of(context).size.width * 0.06,
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.add,
                text: 'Add',
              ),
              GButton(
                icon: Icons.check_circle,
                text: 'Tasks',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

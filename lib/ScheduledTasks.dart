// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';

class ScheduledTasks extends StatefulWidget {
  const ScheduledTasks({Key? key}) : super(key: key);

  @override
  State<ScheduledTasks> createState() => _ScheduledTasksState();
}

class _ScheduledTasksState extends State<ScheduledTasks> {
  List<TaskItem> tasks = [
    TaskItem(title: 'Wake Up', time: '9:00 AM', minutes: 10),
    TaskItem(title: 'OOP Assignment', time: '10:30 AM', minutes: 45),
    TaskItem(title: 'Feed Cats', time: '12:15 PM', minutes: 60),
    TaskItem(title: 'WWDC!!', time: '2:00 PM', minutes: 75),
    TaskItem(title: 'Gym', time: '4:15 PM', minutes: 90),
    TaskItem(title: 'Assignment 3 :(', time: '6:00 PM', minutes: 120),
  ];
  @override
  Widget build(BuildContext context) {
    final List<Color> gradientColors = [
      Color(0xff6e54f7),
      Color(0xffc847f4),
      Color.fromRGBO(110, 119, 248, 0.898)
    ];

    return Scaffold(
      backgroundColor: const Color(0xff212327),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final colorIndex =
              index % 3; // Calculate the color index based on the task index

          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.17,
              child: Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 0.5, 0.8], // Adjust the stops values
                    colors: [
                      gradientColors[
                          colorIndex], // Assign the color dynamically
                      gradientColors[(colorIndex + 2) % 3],
                      gradientColors[(colorIndex + 1) % 3],
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tasks[index].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Text(
                            tasks[index].time,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width * 0.09,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Text(
                            '${tasks[index].minutes} Minutes  ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width * 0.035,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Checkbox
                    Transform.scale(
                      scale:
                          1.8,
                      child: Checkbox(
                        value: tasks[index].isComplete,
                        onChanged: (value) {
                          setState(() {
                            tasks[index].isComplete = value ?? false;
                          });
                        },
                        fillColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TaskItem {
  final String title;
  final String time;
  final int minutes;
  bool isComplete;

  TaskItem({
    required this.title,
    required this.time,
    required this.minutes,
    this.isComplete = false,
  });
}

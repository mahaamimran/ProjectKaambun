// ignore: file_names
import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController taskNameController = TextEditingController();
  bool isEditing = false;
  Color penColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212327),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: 0,
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
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
                            bottom: MediaQuery.of(context).size.width * 0.035,
                            top: MediaQuery.of(context).size.width * 0.053,
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

                // add code here
                //   Text(  "Add Task Page"),
                /*
                ListWheelScrollView(
                  itemExtent: 50,
                  children: [
                    Container(color: Colors.red),
                    Container(color: Colors.green),
                    Container(color: Colors.blue),
                    Container(color: Colors.yellow),
                    Container(color: Colors.orange),
                    Container(color: Colors.pink),
                    Container(color: Colors.cyan),
                    Container(color: Colors.indigo),
                    Container(color: Colors.blueGrey),
                    Container(color: Colors.lightGreen),
                  ],
                ),
                */
              ],
            ),
          ),
        ],
      ),
    );
  }
}

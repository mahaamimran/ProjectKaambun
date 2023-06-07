// ignore: file_names
import 'package:flutter/material.dart';
import 'package:project/signIn.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);


  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool toggleValue1 = false;
  bool toggleValue2 = false;
  bool toggleValue3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212327),
      body: ListView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        children: [
          SettingsOption(
            title: 'Account',
            onTap: () {
              print('Account option tapped');
            },
            toggleValue: toggleValue1,
            onToggleChanged: (value) {
              setState(() {
                toggleValue1 = value;
              });
            },
            hasToggle: false,
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          SettingsOption(
            title: 'Location Services',
            onTap: () {
              print('Location Services tapped');
            },
            toggleValue: toggleValue1,
            onToggleChanged: (value) {
              setState(() {
                toggleValue1 = value;
              });
            },
            hasToggle: false,
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          SettingsOption(
            title: 'General',
            onTap: () {
              print('General option tapped');
            },
            toggleValue: toggleValue2,
            onToggleChanged: (value) {
              setState(() {
                toggleValue2 = value;
              });
            },
            hasToggle: false,
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          SettingsOption(
            title: 'Privacy',
            onTap: () {
              print('Privacy option tapped');
            },
            toggleValue: toggleValue3,
            onToggleChanged: (value) {
              setState(() {
                toggleValue3 = value;
              });
            },
            hasToggle: false,
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          SettingsOption(
            title: 'Notifications',
            onTap: () {
              print('Notifications option tapped');
            },
            toggleValue: toggleValue1,
            onToggleChanged: (value) {
              setState(() {
                toggleValue1 = value;
              });
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          SettingsOption(
            title: 'Allow Cookies',
            onTap: () {
              print('Allow Cookies option tapped');
            },
            toggleValue: toggleValue2,
            onToggleChanged: (value) {
              setState(() {
                toggleValue2 = value;
              });
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          SettingsOption(
            title: 'Face Recognition',
            onTap: () {
              print('Face Recognition option tapped');
            },
            toggleValue: toggleValue3,
            onToggleChanged: (value) {
              setState(() {
                toggleValue3 = value;
              });
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          LogoutButton(
            onTap: () {
              print('Logout button tapped');
              // go to login page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool hasToggle;
  final bool toggleValue;
  final ValueChanged<bool> onToggleChanged;

  const SettingsOption({
    required this.title,
    required this.onTap,
    this.hasToggle = true,
    this.toggleValue = false,
    required this.onToggleChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Color.fromARGB(57, 111, 113, 135),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.036,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (hasToggle)
              Switch(
                value: toggleValue,
                onChanged: onToggleChanged,
                activeColor: Color(
                    0xffc847f4), // Customize the active color of the switch
                inactiveThumbColor: Colors
                    .grey, // Customize the inactive thumb color of the switch
                inactiveTrackColor: Colors.grey.withOpacity(0.5),
              ),
          ],
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  final VoidCallback onTap;

  const LogoutButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 151, 10, 0), // Customize the button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        child: Text(
          'Logout',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

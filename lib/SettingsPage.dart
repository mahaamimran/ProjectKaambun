// ignore: file_names
import 'package:flutter/material.dart';
 
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
    padding: EdgeInsets.all(16.0),
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
        hasToggle: false, // No toggle button for this option
      ),
      SizedBox(height: 16.0),
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
        hasToggle: false, // No toggle button for this option
      ),
      SizedBox(height: 16.0),
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
        hasToggle: false, // No toggle button for this option
      ),
      SizedBox(height: 16.0),
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
      SizedBox(height: 16.0),
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
      SizedBox(height: 16.0),
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
      SizedBox(height: 16.0),
      LogoutButton(
        onTap: () {
          print('Logout button tapped');
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
        padding: EdgeInsets.all(16.0),
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
                fontSize: 16.0,
              ),
            ),
            if (hasToggle) Switch(
              value: toggleValue,
              onChanged: onToggleChanged,
                            activeColor: Color(0xff6e54f7),// Customize the active color of the switch
              inactiveThumbColor: Colors.grey, // Customize the inactive thumb color of the switch
              inactiveTrackColor: Colors.grey.withOpacity(0.5), // Customize the inactive track color of the switch
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
        padding: EdgeInsets.all(16.0),
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

             

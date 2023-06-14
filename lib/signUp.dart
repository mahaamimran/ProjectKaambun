import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:project/welcome.dart';
import 'signIn.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // username and password input controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // sign in button pressed
  bool _isSignInPressed = false;
  bool _isSignUpPressed = false;
  bool _hidePassword = true;
  bool _isEyeIconPressed = false;
  void authenticateUser(BuildContext context) {
    if (nameController.text == "mahamimran" &&
        passwordController.text == "Maham##2") {
      print("user authenticated");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    } else if (nameController.text == "mahamimran" &&
        passwordController.text != "Maham##2") {
      print("invalid password");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid password.'),
        ),
      );
    } else if (nameController.text != "mahamimran" &&
        passwordController.text == "Maham##2") {
      print("invalid username");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid username.'),
        ),
      );
    } else if (nameController.text == "" && passwordController.text == "") {
      print("Please fill in both the username and password fields.");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('fill in both the username and password fields.'),
        ),
      );
    } else {
      print("invalid username and password");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid username and password.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Color(0xff212327),
          body: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Column(
              children: [
                // top space
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                // Hi there!
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Hi there!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.075,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // space after hi there
                SizedBox(height: MediaQuery.of(context).size.height * 0.003),
                // you've been missed
                Text(
                  "welcome to kaamBun",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
                // space after welcome
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                // username dabba
                Container(
                  // dabba dimentions
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.068,
                  decoration: BoxDecoration(
                    color: Color(0xff393c41),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Create a username',
                      contentPadding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.04,
                          bottom: MediaQuery.of(context).size.width * 0.035,
                          top: MediaQuery.of(context).size.width * 0.053,
                          right: MediaQuery.of(context).size.width * 0.03),
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    // input white
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                // space after username dabba
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                // password dabba
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.068,
                  decoration: BoxDecoration(
                    color: Color(0xff393c41),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          obscureText: _hidePassword,
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Create a password',
                            contentPadding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.04,
                              bottom: MediaQuery.of(context).size.width * 0.035,
                              top: MediaQuery.of(context).size.width * 0.053,
                              right: MediaQuery.of(context).size.width * 0.03,
                            ),
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      // eye icon
                      GestureDetector(
                        onTap: () {
                          print("Eye icon pressed");
                          setState(() {
                            _isEyeIconPressed = !_isEyeIconPressed;
                            _hidePassword = !_hidePassword;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.04),
                          child: Image.asset(
                            _isEyeIconPressed
                                ? 'assets/openeyeicon.png'
                                : 'assets/eyeicon.png',
                            width: MediaQuery.of(context).size.width * 0.05,
                            height: MediaQuery.of(context).size.height * 0.05,
                            color: _isEyeIconPressed
                                ? Color.fromRGBO(203, 124, 229, 1)
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // space after password dabba
                SizedBox(height: MediaQuery.of(context).size.height * 0.065),
                GestureDetector(
                  onTapDown: (_) => setState(() => _isSignInPressed = true),
                  onTapUp: (_) => setState(() => _isSignInPressed = false),
                  onTapCancel: () => setState(() => _isSignInPressed = false),
                  onTap: () {
                    print("Sign in button pressed");
                    print(nameController.text);
                    print(passwordController.text);
                    authenticateUser(context);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: _isSignInPressed
                              ? Colors.white
                              : Color(0x3d9471cf),
                          offset: Offset(0, 4),
                          blurRadius: _isSignInPressed ? 24 : 16,
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: _isSignInPressed
                            ? [
                                Color(0xff6e54f7),
                                Color(0xffc847f4),
                              ]
                            : [
                                Color(0xffc847f4),
                                Color(0xff6e54f7),
                              ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontFamily: "Cupertino",
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                      vertical: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ),
                // space after sign up button
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                 Align(
                  alignment: Alignment.center,
                  child: Text(
                    "By signing up you agree to our terms & conditions",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.032,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                Container(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                          thickness: 0.8,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Text(
                        "or",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                          thickness: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
                // space after or line
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/applelogo.png',
                        ),
                        Image.asset(
                          'assets/googlelogo.png',
                        ),
                        Image.asset(
                          'assets/facebooklogo.png',
                        ),
                      ],
                    ),
                  ],
                ),
                // space after social media icons
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: "Cupertino",
                        letterSpacing: 0,
                      ),
                      children: [
                        TextSpan(
                          text: "Log in",
                          style: TextStyle(
                            color: Color.fromRGBO(203, 124, 229, 1),
                            fontWeight: FontWeight.bold,
                            decoration: _isSignUpPressed
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            // Add a glow effect
                            shadows: _isSignUpPressed
                                ? [
                                    BoxShadow(
                                      color: Color.fromRGBO(203, 124, 229, 0.8),
                                      blurRadius: 16,
                                      spreadRadius: 4,
                                    ),
                                  ]
                                : [],
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTapDown = (_) {
                              setState(() {
                                _isSignUpPressed = true;
                              });
                            }
                            ..onTapUp = (_) {
                              setState(() {
                                _isSignUpPressed = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPage()),
                              );
                            }
                            ..onTapCancel = () {
                              setState(() {
                                _isSignUpPressed = false;
                              });
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                // Add more Text widgets or other widgets for additional children
              ],
            ),
          ),
        );
      }),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// Import sqflite.dart file
import 'package:scratcher/scratcher.dart'; // Import ScratchCard widget
import 'mainsScreen.dart'; // Ensure this imports MyAppp
import 'main.dart';
import 'screens/sqflite.dart'; // Import necessary files

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  String _errorMessage = '';

  Future<void> _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username.isEmpty && password.isEmpty) {
      setState(() {
        _errorMessage = 'Need input of your credentials';
      });
    } else if (username.isEmpty) {
      setState(() {
        _errorMessage = 'Username cannot be empty';
      });
    } else if (password.isEmpty) {
      setState(() {
        _errorMessage = 'Password cannot be empty';
      });
    } else if (username == 'hamza' && password == '123') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyAppp()),
      );
    } else {
      setState(() {
        _errorMessage = 'Incorrect credentials';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF8A2387),
                      Color(0xFFE94057),
                      Color(0xFFF27121),
                    ],
                  ),
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth:
                          600.0, // Max width to fit desktop without scrolling
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 40),
                            Image.asset(
                              "assets/images/cart.png",
                              height: 60, // Adjusted for desktop
                              width: 100, // Adjusted for desktop
                            ),
                            SizedBox(height: 8),
                            Text(
                              'LOGO',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: double
                                  .infinity, // Full width within constraints
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      'Hey',
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Center(
                                    child: Text(
                                      'Please Login',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 9),
                                  TextField(
                                    controller: _usernameController,
                                    decoration: InputDecoration(
                                      labelText: 'Email address',
                                      suffixIcon: Icon(
                                        FontAwesomeIcons.envelope,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TextField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      suffixIcon: Icon(
                                        FontAwesomeIcons.eyeSlash,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Forgot password',
                                      style: TextStyle(
                                          color: Colors.deepOrangeAccent),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  GestureDetector(
                                    onTap: _login,
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(14.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xFF8A2387),
                                              Color(0xFFE94057),
                                              Color(0xFFF27121),
                                            ],
                                          ),
                                        ),
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  if (_errorMessage.isNotEmpty)
                                    Container(
                                      padding: EdgeInsets.all(1),
                                      child: Scratcher(
                                        brushSize: 20,
                                        color: Colors.grey,
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          child: Center(
                                            child: Text(
                                              _errorMessage,
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  SizedBox(height: 20),
                                  Center(
                                    child: Text(
                                      'or login with',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.facebook,
                                        color: Colors.orangeAccent,
                                        size: 30,
                                      ),
                                      Icon(
                                        FontAwesomeIcons.google,
                                        color: Colors.orangeAccent,
                                        size: 30,
                                      ),
                                      Icon(
                                        FontAwesomeIcons.instagram,
                                        color: Colors.orangeAccent,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

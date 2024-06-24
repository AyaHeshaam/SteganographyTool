import 'package:flutter/material.dart';
import 'login_form.dart'; // Import the login form page file
import 'registration_form.dart'; // Import the registration form page file

class LoginOrRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Set app bar background color to black
        title: Text(
          'STEGASUS',
          style: TextStyle(
            color: Colors.white, // Change text color to white
            fontSize: 30, // Set text size
            fontWeight: FontWeight.bold, // Set text weight to bold
            fontStyle: FontStyle.italic, // Make text italic
          ),
        ),
      ),
      body: Container(
        color: Colors.blueGrey[50], // Set the background color to blue grey
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20), // Add margin to create space between the content and border
              padding: EdgeInsets.all(20), // Add padding to create space between the content and border
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.blueGrey[100]!], // Set gradient colors
                ),
                borderRadius: BorderRadius.circular(20), // Set border radius
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 2, blurRadius: 5)], // Add subtle shadow
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Align text to the top
                crossAxisAlignment: CrossAxisAlignment.center, // Center text horizontally
                children: <Widget>[
                  Text(
                    'Sign in/Sign up to uncover secrets!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '',
                    style: TextStyle(
                      color: Colors.black, // Set text color to black
                      fontSize: 20, // Set text size
                      fontWeight: FontWeight.bold, // Set text weight to bold
                      fontStyle: FontStyle.italic, // Set text style to italic
                      // You can add more text styles here as needed
                    ),
                  ),
                  SizedBox(height: 70), // Adjusted height
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the LoginFormPage
                      Navigator.pushNamed(context, '/login_form');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 80), backgroundColor: Colors.black, // Set button background color to black
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), // Set button shape
                      elevation: 5, // Add elevation
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white, // Set text color to white
                        fontSize: 20, // Set text size
                        fontWeight: FontWeight.bold, // Set text weight to bold
                        // You can add more text styles here as needed
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Adjusted height
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the RegisterFormPage
                      Navigator.pushNamed(context, '/register_form');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 80), backgroundColor: Colors.black, // Set button background color to black
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), // Set button shape
                      elevation: 5, // Add elevation
                    ),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white, // Set text color to white
                        fontSize: 20, // Set text size
                        fontWeight: FontWeight.bold, // Set text weight to bold
                        // You can add more text styles here as needed
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

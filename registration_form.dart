import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth

class RegisterFormPage extends StatelessWidget {
  final Function navigateToImageUpload;

  RegisterFormPage({required this.navigateToImageUpload});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueGrey, Colors.white], // Gradient from blue-grey to white
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 9.0),
                  child: Text(
                    'Sign Up To Access Our Steganalysis App!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.white, // Change text color to blue-grey
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40),
                RegisterForm(navigateToImageUpload: navigateToImageUpload),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  final Function navigateToImageUpload;

  RegisterForm({required this.navigateToImageUpload});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _mobileNumberController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileNumberController.dispose();
    super.dispose();
  }

  late String _username;
  late String _email;
  late String _password;
  late String _mobileNumber;

  Future<void> _createAccount() async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // If user creation successful, navigate to image upload page
      widget.navigateToImageUpload(context);
    } catch (e) {
      // Handle user creation errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to create account. Please try again."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: TextStyle(fontSize: 18, color: Colors.blueGrey),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
            onSaved: (value) {
              _username = value!;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(fontSize: 18, color: Colors.blueGrey),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            onSaved: (value) {
              _email = value!;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(fontSize: 18, color: Colors.blueGrey),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            onSaved: (value) {
              _password = value!;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _mobileNumberController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Mobile Number',
              labelStyle: TextStyle(fontSize: 18, color: Colors.blueGrey),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your mobile number';
              }
              return null;
            },
            onSaved: (value) {
              _mobileNumber = value!;
            },
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                _createAccount();
              }
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.blueGrey,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Create Account',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
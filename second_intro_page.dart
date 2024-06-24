import 'package:flutter/material.dart';
import 'login_register.dart';

class SecondIntroPage extends StatefulWidget {
  @override
  _SecondIntroPageState createState() => _SecondIntroPageState();
}

class _SecondIntroPageState extends State<SecondIntroPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward().then((value) {
      // Navigate to the LoginOrRegisterPage after animation ends
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginOrRegisterPage()), // Navigate to LoginOrRegisterPage
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.blueGrey,
          ),
          Center(
            child: Opacity(
              opacity: _animation.value,
              child: Text(
                'Unveiling the hidden truths!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

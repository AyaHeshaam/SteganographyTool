import 'package:flutter/material.dart';
import 'dart:io';
import 'SubscriptionPage.dart';
import 'pay_with_card_page.dart'; // Import the PayWithCardPage

class PaymentMethodPage extends StatelessWidget {
  final File selectedImage;
  final String result;
  final Function onPaymentSuccess;

  PaymentMethodPage({
    required this.selectedImage,
    required this.result,
    required this.onPaymentSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Payment Method'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SubscriptionPage(
                      onPaymentSuccess: onPaymentSuccess,
                      selectedImage: selectedImage,
                      result: result,
                    ),
                  ),
                );
              },
              child: Text('Pay with Cash'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, primary: Colors.blueGrey,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PayWithCardPage(
                      selectedImage: selectedImage,
                      result: result,
                      onPaymentSuccess: onPaymentSuccess,
                    ),
                  ),
                );
              },
              child: Text('Pay with Card'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blueGrey,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

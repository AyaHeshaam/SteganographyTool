import 'package:flutter/material.dart';
import 'dart:io';
import 'stego_helper.dart';

class ExtractedContentPage extends StatelessWidget {
  final File image;

  const ExtractedContentPage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stegoHelper = StegoHelper();

    return Scaffold(
      appBar: AppBar(
        title: Text('Extracted Content'),
        backgroundColor: Colors.grey[300],
        elevation: 0,
      ),
      body: FutureBuilder<String>(
        future: stegoHelper.extractMessage(image),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Center(
                child: Text(snapshot.data!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              );
            } else if (snapshot.hasError) {
              return Text("Error extracting message: ${snapshot.error}");
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

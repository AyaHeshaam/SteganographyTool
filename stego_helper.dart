import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

class StegoHelper {
  static const platform = MethodChannel('com.yourcompany.imgstego/stego');

  Future<String> extractMessage(File imageFile) async {
    try {
      final String result = await platform.invokeMethod('extractMessage', {'imagePath': imageFile.path});
      return result;
    } on PlatformException catch (e) {
      return "Failed to Extract Message: '${e.message}'.";
    }
  }
}

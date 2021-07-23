import 'package:flutter/material.dart';
import 'package:flutter_web/src/app.dart';

void main() {
  runApp(MaterialApp(
    home: App(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.black,
    ),
  ));
}

import 'package:covid19_tracker/datasource.dart';
import 'package:covid19_tracker/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Lora', primaryColor: primaryBlack),
    home: Homepage(),
  ));
}

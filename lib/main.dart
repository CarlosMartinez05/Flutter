import 'package:flutter/material.dart';
import 'package:task_tools/src/pages/home.dart';
//enter point for App
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}

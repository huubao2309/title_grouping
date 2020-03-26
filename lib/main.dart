import 'package:flutter/material.dart';
import 'package:title_grouping/test/example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Title Grouping',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GroupViewDemo(),
    );
  }
}

// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:truelog/pages/add_note.dart';
import 'package:truelog/pages/feedback.dart';
import 'package:truelog/pages/homescreen.dart';

void main() async {
  await Hive.initFlutter();
  //opening a box
  var box = await Hive.openBox('mybox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen(),
      routes: {'/feedback': (context) => FeedBack()},
    );
  }
}

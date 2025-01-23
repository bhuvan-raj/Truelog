// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:TrueLog/pages/feedback.dart';
import 'package:TrueLog/pages/homescreen.dart';
import 'package:TrueLog/pages/splash_screen.dart';
import 'package:TrueLog/pages/tutorial_ref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); //opening a box
  var box = await Hive.openBox('mybox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Merienda'
        )
      ),
      home: SplashScreen(), // Set SplashScreen as the initial screen
      routes: {
        '/home': (context) => HomeScreen(),
        '/feedback': (context) => FeedBack(),
        '/tutorials': (context)=> TutorialRef()
      },
    );
  }
}

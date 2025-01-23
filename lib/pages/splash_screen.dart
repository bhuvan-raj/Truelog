import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:TrueLog/pages/homescreen.dart';
import 'package:TrueLog/pages/tutorial_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_launch();
  }

  void check_launch() async {
    final box = Hive.box('myBox');
    bool islaunch = box.get('firstLaunch', defaultValue: true);
    if (islaunch) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => TutorialScreen()));
      });
    } else {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Screenh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(117, 103, 101, 101),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top: Screenh * 0.3),
          child: Column(
            children: [
              SizedBox(height: 20),
              //name
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 2),
                builder: (context, double value, child) {
                  return Opacity(
                    opacity: value,
                    child: const Text(
                      'TrueLog',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  );
                },
              ),
              SizedBox(
                  height:
                      18), //to add space btw name and moto              // Motto Text
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 2),
                builder: (context, double value, child) {
                  return Opacity(
                    opacity: value,
                    child: const Text(
                      'Stay Organized.Stay Inspired',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.white),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

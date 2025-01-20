import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
     final Screenh = MediaQuery.of(context).size.height;

    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacementNamed(context,
          '/home'); //navigator.push is for stacking the current page under the next pushed page
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(117, 103, 101, 101),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding:  EdgeInsets.only(top: Screenh*0.3),
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
          
              SizedBox(height: 18), //to add space btw name and moto
          
              // Motto Text
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

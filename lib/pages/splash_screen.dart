import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context,
          '/home'); //navigator.push is for stacking the current page under the next pushed page
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(117, 103, 101, 101),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            //name
            Text(
              'TrueLog',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 10), //to add space btw name and moto

            // Motto Text
            Text(
              'From Ideas to Reality',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.white, // Lighter color for the motto
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:TrueLog/pages/bottompart.dart';

class FeedBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the default back button
        backgroundColor: const Color.fromARGB(117, 103, 101, 101),
        elevation: 0,
        title: Text(
          'Truelog',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded), // Custom back button icon
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Stack(
        // for displaying text over image
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: screenH * 0.335,
            child: Container(
              padding: EdgeInsets.all(screenH * 0.02),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "Need help with TrueLog? We're here for you! If you're experiencing any issues or have questions, feel free to reach out to us through our Social Media handles.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(117, 103, 101, 101),
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: screenH * 0.133), // to lower the container a bit
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/crowned_boy.png',
                      height: screenH * 0.30,
                      width: screenW * 0.20,
                    ),
                    SizedBox(
                      // spacing between two images
                      height: 30,
                      width: screenW * 0.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Image.asset(
                        'assets/boy.png',
                        height: screenH * 0.30,
                        width: screenW * 0.20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Bottompart() //bottom part of the page is a separate page
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:truelog/pages/bottompart.dart';

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
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: screenH * 0.325,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "Need help with TrueLog? We're here for you! If you're experiencing any issues or have questions, feel free to reach out to us.Our Social Media handles are given below",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: screenH * 0.02,
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
                    height:
                        120), // aa container full ayit kurachoode thazhott idan
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/crowned_boy.png',
                      height: screenH * 0.30,
                      width: screenW * 0.20,
                    ),
                    const SizedBox(
                      height: 30,
                      width: 200,
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
          Bottompart()
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:truelog/pages/bottompart.dart';

class FeedBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: screenH * 0.3,
            child: Container(
              padding: EdgeInsets.all(screenH * 0.02),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: Text(
                  "Need help with TrueLog? We're here for you! If you're experiencing any issues or have questions, feel free to reach out to us through our Social Media handles.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: screenH * 0.02,
                  ),
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
                SizedBox(height: screenH * 0.133),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/crowned_boy.png',
                      height: screenH * 0.25,
                      width: screenW * 0.25,
                    ),
                    SizedBox(height: 30, width: screenW * 0.4),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Image.asset(
                        'assets/boy.png',
                        height: screenH * 0.25,
                        width: screenW * 0.25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Bottompart(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FeedBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the default back button
        backgroundColor: const Color.fromARGB(117, 103, 101, 101),
        elevation: 0,
        title: Text(
          'TrueLog',
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
                      height: 100,
                      width: 80,
                    ),
                    Image.asset(
                      'assets/boy.png',
                      height: 200,
                      width: 60,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Need help with TrueLog? We're here for you! If you're experiencing any issues or have questions, feel free to reach out to us. support@truelogapp.com",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            //social media icons
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Image.asset(
                      'assets/twitter.png',
                      height: 45,
                      width: 60,
                    ),
                    onPressed: () {
                      // Add action for Twitter
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/insta.png',
                      height: 50, // Resize social media icon
                      width: 70,
                    ),
                    onPressed: () {
                      // Add action for Instagram
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/gmail.png',
                      height: 50, // Resize social media icon
                      width: 50,
                    ),
                    onPressed: () {
                      // Add action for Gmail
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

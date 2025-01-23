import 'package:flutter/material.dart';
/*
  This page is created as a placeholder of a title and content for each of the pages in the pageview of the Tutorial.
  We can reuse this for each page in the pageview */

class TutorialPage extends StatelessWidget {
  String title;
  String content;
   TutorialPage({super.key,     //used constructors for passing values
   required this.title,  
   required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          textAlign: TextAlign.center,
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          content,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

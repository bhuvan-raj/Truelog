import 'package:flutter/material.dart';
import 'package:truelog/pages/homescreen.dart';

class TutorialScreen extends StatelessWidget {
  TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Tutorial",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
      body: PageView(
        children: [
          _buildpage('Welcome to Notes App', 'Here you can take notes.'),
          _buildpage('Double Tap to View',
              'Double tap the title of a note to view its contents.'),
          _buildpage('Long Press to Delete',
              'Long press the title to show the delete button.'),
          _buildpage('ontapdown to remove delete option',
              'tap anywhere else to remove the delete button')
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: Text("Continue"),
      ),
    );
  }

  Widget _buildpage(String title, String content) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          content,
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}

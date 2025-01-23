import 'package:flutter/material.dart';
import 'package:truelog/pages/note_display.dart';

class EmptyHomepage extends StatelessWidget {
  final screensize;
  const EmptyHomepage({super.key, required this.screensize});

  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        color: Color.fromARGB(69, 103, 101, 101),
        width: screensize.width,
        height: screensize.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/main_image.jpg', height: screenH * 0.75),
            SizedBox(height: screenH * 0.05),
            Expanded(
              child: Text(
                'Create your first note!',
                style: TextStyle(
                    fontSize: screenH * 0.022, color: Colors.grey[300]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

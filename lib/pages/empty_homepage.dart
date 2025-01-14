import 'package:flutter/material.dart';

class EmptyHomepage extends StatelessWidget {
  final screensize;
  const EmptyHomepage({super.key,required this.screensize});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromARGB(69, 103, 101, 101),
        width: screensize.width,
        height: screensize.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/main_image.jpg'),
            SizedBox(height: 20),
            Text(
              'Create your first note!',
              style: TextStyle(fontSize: 16, color: Colors.grey[300]),
            ),
          ],
        ),
      ),
    );
  }
}

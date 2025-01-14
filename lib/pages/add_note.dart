import 'package:flutter/material.dart';
import 'package:truelog/db/database.dart';

class AddNoteScreen extends StatelessWidget {
  final controller_title;
  final controller_note;
  Database db = new Database();
  final void Function(String?, String?)? onSaved;
  AddNoteScreen(
      {super.key,
      required this.controller_note,
      required this.controller_title,
      required this.onSaved});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(
          117, 103, 101, 101), // Background Darkness intensity reduce cheyan
      appBar: AppBar(
        backgroundColor: Color.fromARGB(117, 103, 101, 101),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context); // Return to the home screen
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(132, 118, 113, 113),
                  borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
          if (onSaved != null) {
            onSaved!(controller_title.text, controller_note.text); // Pass values
          }
        }, // Save the note (implement your save logic)
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Title insert stalam
            TextField(
              controller: controller_title,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(fontSize: 28, color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(
                height: 10), // space between title and type something
            // Note body input field
            Expanded(
              child: TextField(
                controller: controller_note,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  hintText: 'Type something...',
                  hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

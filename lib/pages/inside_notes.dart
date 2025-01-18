import 'package:flutter/material.dart';

class InsideNotes extends StatefulWidget {
  String title;
  String note;
  InsideNotes({super.key, required this.title, required this.note});

  @override
  State<InsideNotes> createState() => _InsideNotesState();
}

class _InsideNotesState extends State<InsideNotes> {
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
                  // if (onSaved != null) {
                  //  onSaved!(controller_title.text, controller_note.text); // Pass values
                  // }
                }, // Save the note (implement your save logic)
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: TextStyle(
                  //  decoration: TextDecoration.underline,
                  //  height: 1.0,
                  fontSize: 45,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.note,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromARGB(117, 103, 101, 101),
        child: Icon(
          Icons.edit_sharp,
          size: 30,
        ),
      ),
    );
  }
}

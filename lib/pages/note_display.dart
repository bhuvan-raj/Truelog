import 'package:flutter/material.dart';
import 'package:truelog/db/database.dart';

class NoteDisplay extends StatefulWidget {
  NoteDisplay({super.key});

  @override
  State<NoteDisplay> createState() => _NoteDisplayState();
}

class _NoteDisplayState extends State<NoteDisplay> {
  Database db = Database();
  @override
  void initState() {
    super.initState();
    // Ensure data is loaded correctly (you may need to call this on initialization)
    db.updateData();
    print(db.notes); // Make sure data is updated when this screen is loaded
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: db.notes.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(db.notes[index][0]));
        },
      ),
    );
  }
}

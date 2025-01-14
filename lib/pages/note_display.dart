import 'package:flutter/material.dart';
import 'package:truelog/db/database.dart';

class NoteDisplay extends StatelessWidget {
  Database db=new Database();
 NoteDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(itemCount: db.notes.length,
      itemBuilder: (context, index) => db.notes[index][0],
      ),
    );
  }
}

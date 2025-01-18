import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:truelog/db/database.dart';

class NoteDisplay extends StatefulWidget {
  NoteDisplay({super.key});

  @override
  State<NoteDisplay> createState() => _NoteDisplayState();
}

class _NoteDisplayState extends State<NoteDisplay> {
  Database db = Database();
  void delete()
  {

  }
  void displaynote()
  {

  }
  @override
  void initState() {
    super.initState();
    // Ensure data is loaded correctly (you may need to call this on initialization)
    db.loadData();
    // print("hello");
    // print(db.notes); // Make sure data is updated when this screen is loaded
    // Add listener to box changes
    print("All notes: ${db.notes}");

    // Print each note separately with index
    for (int i = 0; i < db.notes.length; i++) {
      print("Note $i - Title: ${db.notes[i][0]}, Content: ${db.notes[i][1]}");
    }
    Hive.box('myBox').listenable().addListener(() {
      if (mounted) {
        setState(() {
          db.loadData();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Screenh = MediaQuery.of(context).size.height;
    return Container(
      color: const Color.fromARGB(255, 60, 59, 59),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          itemCount: db.notes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 6.0, right: 6.0),
              child: GestureDetector(
                onLongPress: delete,
                onTap: displaynote,
                child: Card(
                  color: const Color.fromARGB(117, 139, 137, 137),
                  child: ListTile(
                      title: Text(
                    db.notes[index][0] ?? '',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 213, 208, 208),
                        fontWeight: FontWeight.w400,
                        fontSize: Screenh * 0.030),
                  )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

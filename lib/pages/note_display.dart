import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:truelog/db/database.dart';
import 'package:truelog/pages/inside_notes.dart';

class NoteDisplay extends StatefulWidget {
  const NoteDisplay({super.key});

  @override
  State<NoteDisplay> createState() => _NoteDisplayState();
}

class _NoteDisplayState extends State<NoteDisplay> {
  int? longpressedindex = null;
  Database db = Database();

  @override
  void initState() {
    super.initState();
    db.loadData();
    print("All notes: ${db.notes}");
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

  // Helper method to check if delete button was tapped
  // delete button nte positionil click cheyumbol ontapdown workavathe irikan vendi.
  bool isDeleteButtonTapped(TapDownDetails details) {
    final tapPosition = details.globalPosition;
    return tapPosition.dx > MediaQuery.of(context).size.width - 200;
  }

  @override
  Widget build(BuildContext context) {
    final Screenh = MediaQuery.of(context).size.height;
    return Container(
      color: const Color.fromARGB(255, 60, 59, 59),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: GestureDetector(
          onTapDown: (details) {
            // Only hide delete button if we're not tapping on it
            if (longpressedindex != null && !isDeleteButtonTapped(details)) {
              print("entered ontapdown"); //testing
              setState(() {
                longpressedindex = null;
              });
            }
          },
          child: ListView.builder(
            itemCount: db.notes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onDoubleTap: longpressedindex == index  //displaying Inside notes page only if delete button is not there
                    ? null
                    : () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InsideNotes(
                                    title: db.notes[index][0],
                                    note: db.notes[index][1],
                                    index: index)));
                      },
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                  child: Card(
                    color: const Color.fromARGB(117, 139, 137, 137),
                    child: ListTile(
                      onLongPress: () {
                        print("longpressed"); //testing
                        setState(() {
                          longpressedindex = index;
                        });
                      },
                      title: Text(
                        db.notes[index][0] ?? '',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 213, 208, 208),
                            fontWeight: FontWeight.w400,
                            fontSize: Screenh * 0.030),
                      ),
                      trailing: longpressedindex == index
                          ? IconButton(
                              icon: Icon(Icons.delete, color: Colors.white), 
                              onPressed: () {
                                print('Delete button pressed'); //testing 
                                setState(() {
                                  db.notes.removeAt(index);
                                  db.updateData();
                                  longpressedindex = null;
                                });
                              },
                            )
                          : null,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

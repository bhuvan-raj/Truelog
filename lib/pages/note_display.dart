import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:TrueLog/db/database.dart';
import 'package:TrueLog/pages/inside_notes.dart';

double screenH = 0;
double screenW = 0;

class NoteDisplay extends StatefulWidget {
  const NoteDisplay({super.key});

  @override
  State<NoteDisplay> createState() => NoteDisplayState();
}

class NoteDisplayState extends State<NoteDisplay> {
  int? longpressedindex = null;
  Database db = Database();
  bool isSelectionMode = false;
  List<bool> selectedItems = [];

  @override
  void initState() {
    super.initState();
    db.loadData();
    selectedItems = List.generate(db.notes.length, (_) => false);
    print("All notes: ${db.notes}");
    for (int i = 0; i < db.notes.length; i++) {
      print("Note $i - Title: ${db.notes[i][0]}, Content: ${db.notes[i][1]}");
    }
    Hive.box('myBox').listenable().addListener(() {
      if (mounted) {
        setState(() {
          db.loadData();
          selectedItems = List.generate(db.notes.length, (_) => false);
        });
      }
    });
  }

  bool isDeleteButtonTapped(TapDownDetails details) {
    final tapPosition = details.globalPosition;
    return tapPosition.dx > MediaQuery.of(context).size.width - 100;
    // region of delete button adjusted
  }

  @override
  Widget build(BuildContext context) {
    screenH = MediaQuery.of(context).size.height;
    screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: isSelectionMode
          ? AppBar(
              backgroundColor: const Color.fromARGB(117, 103, 101, 101),
              leading: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    isSelectionMode = false;
                    selectedItems =
                        List.generate(db.notes.length, (_) => false);
                  });
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.checklist),
                  onPressed: () {
                    setState(() {
                      final allSelected = selectedItems.every((item) => item);
                      selectedItems =
                          List.generate(db.notes.length, (_) => !allSelected);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      for (int i = selectedItems.length - 1; i >= 0; i--) {
                        if (selectedItems[i]) {
                          db.notes.removeAt(i);
                        }
                      }
                      db.updateData();
                      isSelectionMode = false;
                      selectedItems =
                          List.generate(db.notes.length, (_) => false);
                    });
                  },
                ),
              ],
            )
          : null,
      body: Container(
        color: const Color.fromARGB(255, 60, 59, 59),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: GestureDetector(
            onTapDown: (details) {
              if (longpressedindex != null && !isDeleteButtonTapped(details)) {
                print("entered ontapdown");
                setState(() {
                  longpressedindex = null;
                });
              }
            },
            child: ListView.builder(
              itemCount: db.notes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onDoubleTap: longpressedindex == index || isSelectionMode
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
                        leading: isSelectionMode
                            ? Checkbox(
                                value: selectedItems[index],
                                onChanged: (bool? value) {
                                  setState(() {
                                    selectedItems[index] = value ?? false;
                                  });
                                },
                                activeColor: Colors.white,
                                checkColor: Colors.black,
                              )
                            : null,
                        onTap: isSelectionMode
                            ? () {
                                setState(() {
                                  selectedItems[index] = !selectedItems[index];
                                });
                              }
                            : null,
                        onLongPress: isSelectionMode
                            ? null
                            : () {
                                print("longpressed");
                                setState(() {
                                  longpressedindex = index;
                                });
                              },
                        title: Text(
                          db.notes[index][0] ?? '',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 213, 208, 208),
                              fontWeight: FontWeight.w400,
                              fontSize: screenH * 0.030),
                        ),
                        trailing: longpressedindex == index && !isSelectionMode
                            ? IconButton(
                                icon: Icon(Icons.delete, color: Colors.white),
                                onPressed: () {
                                  print('Delete button pressed');
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
      ),
    );
  }
}

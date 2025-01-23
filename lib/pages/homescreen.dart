import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:truelog/db/database.dart';
import 'package:truelog/pages/add_note.dart';
import 'package:truelog/pages/empty_homepage.dart';
import 'package:truelog/pages/note_display.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<NoteDisplayState> noteDisplayKey =
      GlobalKey<NoteDisplayState>();
  int index = 0;
  Database db = Database();
  final _myBox = Hive.box('myBox');
  final _controller_title = TextEditingController();
  final _controller_note = TextEditingController();

  @override
  void initState() {
    super.initState(); // Always call super.initState() first

    // Load and check notes
    db.loadData(); // Load notes from Hive

    setState(() {
      if (db.notes.isEmpty) {
        // Check if notes list is empty
        index = 0; // Show EmptyHomepage
        print("Notes empty, showing EmptyHomepage");
      } else {
        index = 1; // Show NoteDisplay
        print("Notes exist, showing NoteDisplay");
      }
    });

    // Add listener for changes
    Hive.box('myBox').listenable().addListener(() {
      db.loadData();
      setState(() {
        index = db.notes.isEmpty ? 0 : 1; // Update index based on notes
        print("Notes changed, index updated to: $index");
      });
    });
  }

  void onSaved(String? title, String? note) {
    setState(() {
      if (title!.trim().isEmpty) {
        title = 'Untitled note'; // title empty condition solved
      }
      print("Before adding - Notes: ${db.notes}"); //for testing
      db.loadData();
      //  db.notes.clear();
      db.notes.add([title, note]);
      db.updateData();
      print("After adding - Notes: ${db.notes}"); // for testing
      _controller_title.clear();
      _controller_note.clear();
      if (index != 1) {
        index = 1;
      }
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenH = MediaQuery.of(context).size.height;
    List pages = [
      EmptyHomepage(screensize: screenSize),
      NoteDisplay(key: noteDisplayKey)
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(117, 103, 101, 101),
        elevation: 0,
        title: Text('TrueLog',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'YourCustomFont',
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(117, 103, 101, 101),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: PopupMenuButton(
                onSelected: (int value) {
                  if (value == 1) {
                    if (index == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        //snackbar for empty page
                        SnackBar(
                          content: Center(
                            child: Text(
                              "You haven't added any notes yet !",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenH * 0.02),
                            ),
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor: Color.fromARGB(162, 81, 80, 80),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).padding.bottom +
                                10, // Respects safe area
                            right: MediaQuery.of(context).padding.left + 50,
                            left: MediaQuery.of(context).padding.right + 50,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    } else {
                      noteDisplayKey.currentState?.setState(() {
                        // code for select option
                        noteDisplayKey.currentState?.isSelectionMode = true;
                        noteDisplayKey.currentState?.selectedItems =
                            List.generate(db.notes.length, (_) => false);
                      });
                    }
                  }
                  if (value == 2) {
                    Navigator.pushNamed(context, '/tutorials');
                  }
                  if (value == 3) {
                    Navigator.pushNamed(context, '/feedback');
                  }
                },
                offset: Offset(0, 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                color: const Color.fromARGB(248, 38, 35, 35),
                child: Icon(Icons.more_horiz),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                        value: 1,
                        child: Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.check,
                                size: 20,
                                color: Colors.black,
                              ),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(215, 255, 255, 255),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 7),
                              child: Text("Select"),
                            )
                          ],
                        )),
                    PopupMenuItem(
                        value: 2,
                        child: Row(
                          children: [
                            Icon(Icons.help),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text("Tutorials"),
                            )
                          ],
                        )),
                    PopupMenuItem(
                        value: 3,
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Text("Feedback/contributions"),
                            )
                          ],
                        ))
                  ];
                },
              ),
            ),
          ),
        ],
      ),
      body: pages[index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddNoteScreen(
                      controller_note: _controller_note,
                      controller_title: _controller_title,
                      onSaved: (title, note) {
                        onSaved(title, note);
                      })));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[850],
      ),
      backgroundColor: Colors.black,
    );
  }
}

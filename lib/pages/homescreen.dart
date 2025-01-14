import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:truelog/db/database.dart';
import 'package:truelog/pages/add_note.dart';
import 'package:truelog/pages/empty_homepage.dart';
import 'package:truelog/pages/note_display.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  Database db = Database();
  final _myBox = Hive.box('myBox');
  final _controller_title = TextEditingController();
  final _controller_note = TextEditingController();

  @override
  void initState() {
    // noteapp: implement initState
    if (_myBox.get("NOTES") != null) {
      index = 1;
    }
    super.initState();
  }

  void onSaved(String? title, String? note) {
    setState(() {
      db.notes.add([title, note]);
      _controller_title.clear();
      _controller_note.clear();
      index = 1;
    });
    Navigator.of(context).pop();
    db.updateData;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    List pages = [EmptyHomepage(screensize: screenSize), NoteDisplay()];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(117, 103, 101, 101),
        elevation: 0,
        title: Text('TrueLog',
            style: TextStyle(
                fontSize: 20,
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
                  if (value == 1) {}
                  if (value == 2) {
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
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
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

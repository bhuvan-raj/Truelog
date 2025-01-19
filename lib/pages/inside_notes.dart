import 'package:flutter/material.dart';
import 'package:truelog/db/database.dart';

class InsideNotes extends StatefulWidget {
  Database db = Database();
  String title;
  String note;
  int index;
  InsideNotes(
      {super.key,
      required this.title,
      required this.note,
      required this.index});

  @override
  State<InsideNotes> createState() => _InsideNotesState();
}

class _InsideNotesState extends State<InsideNotes> {
  late TextEditingController _titleController;
  late TextEditingController _noteController;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _noteController = TextEditingController(text: widget.note);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

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
          if (isEditing)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(132, 118, 113, 113),
                    borderRadius: BorderRadius.circular(15)),
                child: IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: () {
                    setState(() {
                      widget.title = _titleController.text;
                      widget.note = _noteController.text;
                      widget.db.loadData;
                      widget.db
                          .updateNote(widget.index, widget.title, widget.note);
                      isEditing = false; // Exit edit mode
                    });
                    Navigator.of(context).pop();
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
              child: !isEditing
                  ? Text(
                      widget.title,
                      style: TextStyle(
                          //  decoration: TextDecoration.underline,
                          //  height: 1.0,
                          fontSize: 45,
                          fontWeight: FontWeight.w400,
                          color: Colors.white70),
                    )
                  : TextField(
                      controller: _titleController,
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: !isEditing
                  ? Text(
                      widget.note,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    )
                  : TextField(
                      controller: _noteController,
                      maxLines: null,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!isEditing) { // if koduthath edit button false anenkil true ayal mathi.reverse venda
            setState(() {   
              isEditing = !isEditing;
            });
          }
        },
        backgroundColor: Color.fromARGB(117, 103, 101, 101),
        child: Icon(
          Icons.edit_sharp, //tick ozhivaki.Unnecessary aan
          size: 30,
        ),
      ),
    );
  }
}

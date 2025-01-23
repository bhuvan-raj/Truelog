import 'package:flutter/material.dart';
import 'package:TrueLog/db/database.dart';

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
  static const String default_Title = 'Untitled note';
  final FocusNode _titleFocus = FocusNode(); //automatic cursor
  late TextEditingController _titleController;
  late TextEditingController _noteController;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
        text: widget.title.isEmpty
            ? default_Title
            : widget.title); // title empty condition solved
    _noteController = TextEditingController(text: widget.note);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    _titleFocus.dispose();
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
                      final newTitle = _titleController.text
                              .trim()
                              .isEmpty //title empty condition
                          ? default_Title
                          : _titleController.text;

                      widget.title = newTitle;
                      //  widget.title = _titleController.text;
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
                      widget.title.isEmpty
                          ? default_Title
                          : widget.title, //title empty condition solved
                      style: TextStyle(
                          //  decoration: TextDecoration.underline,
                          //  height: 1.0,
                          fontSize: 28,
                          color: Colors.white),
                    )
                  : TextField(
                      controller: _titleController,
                      focusNode: _titleFocus, // automatic cursor
                      autofocus: true, // automatic cursor
                      style: TextStyle(
                        fontSize: 28,
                        //  fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: !isEditing
                  ? Text(
                      widget.note,
                      style: TextStyle(
                          fontSize: 22,
                          //    fontWeight: FontWeight.w300,
                          color: Colors.white),
                    )
                  : TextField(
                      controller: _noteController,
                      maxLines: null,
                      style: TextStyle(
                        fontSize: 22,
                        //  fontWeight: FontWeight.w300,
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
          if (!isEditing) {
            // if koduthath edit button false anenkil true ayal mathi.reverse venda
            setState(() {
              isEditing = !isEditing;
              Future.delayed(Duration(milliseconds: 100), () {
                _titleFocus
                    .requestFocus(); // requesting autofocus while enabling editing
              });
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

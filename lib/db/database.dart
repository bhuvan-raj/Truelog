import 'package:hive/hive.dart';

class Database {
  List notes = [];
  final _myBox = Hive.box('myBox');

// if we are trying to open for the first time ever
  void loadData() {
    notes = _myBox.get("NOTES") ?? [];
  }

  void updateData() {
    _myBox.put("NOTES", notes);
  }

  void updateNote(int index, String newTitle, String newNote) {
    loadData();
    notes[index] = [newTitle, newNote];
    updateData();
  }
}

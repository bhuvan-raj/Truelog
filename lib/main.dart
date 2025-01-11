import 'package:flutter/material.dart';
import 'package:truelog/pages/info_screen.dart';
import 'package:truelog/pages/add_note.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen(),
      routes: {
        '/addnote': (context) => AddNoteScreen(),
        '/infoscreen': (context) => InfoScreen()
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
              child: IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {
                  Navigator.pushNamed(context, '/infoscreen');
                },
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          color: Color.fromARGB(69, 103, 101, 101),
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Create your first note!',
                style: TextStyle(fontSize: 16, color: Colors.grey[300]),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addnote');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[850],
      ),
      backgroundColor: Colors.black,
    );
  }
}

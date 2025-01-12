// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:truelog/pages/add_note.dart';
import 'package:truelog/pages/feedback.dart';

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
        '/feedback': (context) => FeedBack()
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
      body: Center(
        child: Container(
          color: Color.fromARGB(69, 103, 101, 101),
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/main_image.jpg'),
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

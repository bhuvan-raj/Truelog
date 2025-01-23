import 'dart:async';

import 'package:flutter/material.dart';
import 'package:TrueLog/pages/tutorial_page.dart';
/*
  This page is for further reference of tutorial for users.
  If they find it difficult to remember the gestures for various operations like deletion,display,etc.
  They can refer to this page */

class TutorialRef extends StatefulWidget {
  TutorialRef({super.key});

  @override
  State<TutorialRef> createState() => _TutorialRefState();
}

class _TutorialRefState extends State<TutorialRef> {
  final PageController _pageController = PageController();
  int currentpage = 0;
  final int totalpages = 3;
  @override
  void initState() {
    // implement initState
    super.initState();
  }

  @override
  void dispose() {
    //  implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(117, 103, 101, 101),
      appBar: AppBar(
        centerTitle: true,   // now the title will awlays remain at the center
                             // dont wrap appbar with center widget,rather set centertitle to true
        backgroundColor: const Color.fromARGB(255, 74, 72, 72),
        title: Text(
          "Tutorial",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  currentpage = page;
                });
              },
              children: [
                TutorialPage(
                    title: 'Welcome to TrueLog',
                    content: 'Here you can take notes.'),
                TutorialPage(
                    title: 'Double Tap to View',
                    content:
                        'Double tap the title of a note to view its contents.'),
                TutorialPage(
                    title: 'Long Press to Delete',
                    content: 'Long press the title to show the delete button.'),
                TutorialPage(
                    title: 'Ontapdown to remove delete option',
                    content: 'Tap anywhere else to remove the delete button'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(ScreenW * 0.06),
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: currentpage > 0
                        ? () {
                            _pageController.previousPage(
                                duration: Duration(microseconds: 300),
                                curve: Curves.easeInOut);
                          }
                        : null,
                    child: Icon(
                      Icons.arrow_back_sharp,
                      size: ScreenW * 0.06,
                    )),
                Expanded(child: SizedBox(width: ScreenW * 0.1)),
                ElevatedButton(
                    onPressed: currentpage < totalpages
                        ? () {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          }
                        : null,
                    child: Icon(
                      Icons.arrow_forward_sharp,
                      size: ScreenW * 0.06,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

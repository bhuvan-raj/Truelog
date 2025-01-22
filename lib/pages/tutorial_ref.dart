import 'dart:async';

import 'package:flutter/material.dart';
import 'package:truelog/pages/tutorial_page.dart';
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
  Timer? _timer;
  int currentpage = 0;
  @override
  void initState() {
    // implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentpage < 3) {
        currentpage++;
        _pageController.animateToPage(currentpage,
            duration: Duration(milliseconds: 350), curve: Curves.easeIn);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    //  implement dispose
    super.dispose();
    _timer?.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(117, 103, 101, 101),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 74, 72, 72),
        title: Padding(
          padding: EdgeInsets.only(left: ScreenW * 0.23),
          child: Text(
            "Tutorial",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            currentpage = page;
          });
        },
        children: [
          TutorialPage(title: 'Welcome to TrueLog', content: 'Here you can take notes.'),
          TutorialPage(title: 'Double Tap to View',
              content: 'Double tap the title of a note to view its contents.'),
          TutorialPage(title: 'Long Press to Delete',
              content: 'Long press the title to show the delete button.'),
          TutorialPage(title: 'Ontapdown to remove delete option',
              content: 'Tap anywhere else to remove the delete button'),
        ],
      ),
    );
  }

  
}

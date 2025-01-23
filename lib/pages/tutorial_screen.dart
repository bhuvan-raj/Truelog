import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:TrueLog/pages/homescreen.dart';
import 'package:TrueLog/pages/tutorial_page.dart';

class TutorialScreen extends StatefulWidget {
  TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController _pageController =
      PageController(); //variable to control pageview
  Timer? _timer; // timer for page scrolling
  int currentpage = 0; //tracking the current page
  final box = Hive.box('myBox'); //using hive for first time opening only
  @override
  void initState() {
    // implement initState
    super.initState();
    box.put('firstLaunch',
        false); // if the execution enters this page,firstLaunch is set to false.It will never return to true
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      //setting timer for pageview
      if (currentpage < 4) {
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
    // using dispose function for efficient memory management
    //  implement dispose
    super.dispose();
    _timer?.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(117, 103, 101, 101),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 74, 72, 72),
        title: Center(
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
          // function to track the change in pages
          setState(() {
            currentpage = page;
          });
        },
        children: [
          // using tutorialPage,a separate page which contains the title and content.Reusability purpose
          TutorialPage(
              title: 'Welcome to TrueLog',
              content: 'Here you can take notes.'),
          TutorialPage(
              title: 'Double Tap to View',
              content: 'Double tap the title of a note to view its contents.'),
          TutorialPage(
              title: 'Long Press to Delete',
              content: 'Long press the title to show the delete button.'),
          TutorialPage(
              title: 'Ontapdown to remove delete option',
              content: 'Tap anywhere else to remove the delete button'),
          TutorialPage(
              title: 'Tutorials available',
              content:
                  'The tutorials are available in the tutorial section of home page')
        ],
      ),
      floatingActionButton: currentpage == 4 //button appears only when the last page appears
          ? FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 74, 72, 72),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Icon(
                Icons.arrow_forward_sharp,
                size: 35,
              ),
            )
          : null,
    );
  }
}

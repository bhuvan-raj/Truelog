import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Bottompart extends StatelessWidget {
  Bottompart({super.key});

  final Uri url1 = Uri.parse('https://x.com/Devfusionstudio');
  final Uri url2 = Uri.parse('https://www.instagram.com/devfusion_studio/');

  void launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'developerfusionstudio@gmail.com',
    );

    try {
      await launchUrl(emailUri);
    } catch (e) {
      print('Could not launch email client: $e');
    }
  }

  Future<void> launchURL(Uri url) async {
    try {
      await launchUrl(url);
    } catch (e) {
      print('Could not launch $url: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: screenH * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Image.asset(
                'assets/twitter.png',
                height: 45,
                width: 60,
              ),
              onPressed: () => launchURL(url1),
            ),
            IconButton(
              icon: Image.asset(
                'assets/insta.png',
                height: 50,
                width: 70,
              ),
              onPressed: () => launchURL(url2),
            ),
            IconButton(
              icon: Image.asset(
                'assets/gmail.png',
                height: 50,
                width: 50,
              ),
              onPressed: launchEmail,
            ),
          ],
        ),
      ),
    );
  }
}

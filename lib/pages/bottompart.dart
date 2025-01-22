import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Bottompart extends StatelessWidget {
  Bottompart({super.key});
  final Uri _url1 = Uri.parse('https://x.com/Devfusionstudio');
  final Uri _url2 = Uri.parse('https://www.instagram.com/devfusion_studio/');
  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'developerfusionstudio@gmail.com',
    );

    // If the email link can be launched, open it
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch email client';
    }
  }

  // Method to launch URLs
  Future<void> _launchURL(Uri url) async {
    // asynchronous function for launching url
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      //social media icons
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Image.asset(
                'assets/twitter.png',
                height: 45,
                width: 60,
              ),
              onPressed: () {
                _launchURL(_url1);
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/insta.png',
                height: 50, // Resize social media icon
                width: 70,
              ),
              onPressed: () {
                _launchURL(_url2);
                // Add action for Instagram
              },
            ),
            IconButton(
                icon: Image.asset(
                  'assets/gmail.png',
                  height: 50, // Resize social media icon
                  width: 50,
                ),
                onPressed: _launchEmail
                // Add action for Gmail
                ),
          ],
        ),
      ),
    );
  }
}

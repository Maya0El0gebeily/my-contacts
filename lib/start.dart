import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StartSocialMedia extends StatelessWidget {

  Uri url;
  StartSocialMedia({super.key,
      required this.url,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          launchUrl(url , mode: LaunchMode.externalApplication)
        }, child: Text('Start Social Media'),
      )),
    );
  }
}

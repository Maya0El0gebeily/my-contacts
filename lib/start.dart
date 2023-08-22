import 'package:flutter/material.dart';

class StartSocialMedia extends StatelessWidget {
  const StartSocialMedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {}, child: Text('Start Social Media'),
      )),
    );
  }
}

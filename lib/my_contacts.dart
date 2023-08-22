import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/SocialMediaIcon.dart';

class MyContacts extends StatelessWidget {
  MyContacts({super.key});
  Map<String, String> socialMedia = {
    'facebook.png': 'https://www.facebook.com/',
    'instagram.png': 'https://www.instagram.com/',
    'snapchat.png': 'https://web.snapchat.com/',
    'whatsapp.png': 'https://wa.me/+201007295450',
    'viber.png': 'https://viber.com.ru/viber-web',
    'twitter.png': 'https://twitter.com/i/flow/single_sign_on',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 7, 30),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                child: Image(
                  image: AssetImage('assets/MayaElGebeily.jpeg'),
                ),
                radius: 100,
              ),
              Text(
                'Maya',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '+201007295450',
                    style: TextStyle(fontSize: 22, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.phone,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      launchUrl(Uri.parse('tel:+201007295450'));
                    },
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                itemCount: socialMedia.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return SocialMediaIcon(
                    SocialMedia: socialMedia.keys.toList()[index],
                    socialMediaLinks: socialMedia.values.toList()[index],
                  );
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

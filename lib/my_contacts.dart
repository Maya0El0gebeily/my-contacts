import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyContacts extends StatefulWidget {
  MyContacts({super.key});

  @override
  State<MyContacts> createState() => _myContactsState();
}

class _myContactsState extends State<MyContacts> {
  String? myPlatform;
  Uri? myUrl;
  final Uri phoneNumber = Uri.parse('tel:+201007295450');
  final Map myContacts = {
    'facebook.png': Uri.parse('https://www.facebook.com/'),
    'instagram.png': Uri.parse('https://www.instagram.com/'),
    'snapchat.png': Uri.parse('https://web.snapchat.com/'),
    'whatsapp.png': Uri.parse('https://wa.me/+201007295450'),
    'viber.png': Uri.parse('https://viber.com.ru/viber-web'),
    'twitter.png': Uri.parse('https://twitter.com/i/flow/single_sign_on'),
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      left: true,
      top: true,
      right: true,
      maintainBottomViewPadding: true,
      minimum: EdgeInsets.zero,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('My contacts screen'),
          leading: InkWell(
            child: Icon(Icons.home),
            onTap: () {
              print('icon is pressed');
            },
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    myUrl == null
                        ? launchUrl(phoneNumber)
                        : launchUrl(myUrl!,
                            mode: LaunchMode.externalApplication);
                  },
                  icon: myPlatform == null
                      ? Icon(
                          Icons.phone,
                          size: 25,
                          color: Colors.white,
                        )
                      : Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 4,
                          child: Image(
                            image: AssetImage('assets/${myPlatform}.png'),
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                )),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 3, 7, 30),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
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
                    itemCount: 8,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 4,
                          child: InkWell(
                            onTap: () {
                              print('current value = $myPlatform');

                              myPlatform = myContacts.keys.toList()[index];
                              myUrl = myContacts.values.toList()[index];
                              setState(() {});
                              print('current value = $myPlatform');
                              launchUrl(myContacts.values.toList()[index],
                                  mode: LaunchMode.externalApplication);
                            },
                            child: Image(
                              image: AssetImage(
                                  'assets/${myContacts.keys.toList()[index]}.png'),
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                    shrinkWrap: true,
                    primary: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(10),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

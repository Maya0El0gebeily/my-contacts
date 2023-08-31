import 'package:flutter/material.dart';
import 'package:my_contacts/widgets/SocialMediaIcon.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tuple/tuple.dart';


class MyContacts extends StatelessWidget {
  MyContacts({super.key});

  @override
  State<MyContacts> createState() => _myContactsState();
}

class _myContactsState extends State<MyContacts> {
  
  
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
            Selector<ActionIconProvider , Tuple2<String?,Uri?>>(
              selector: (p0, p1) => Tuple2(p1.getMyPlatform(), p1.getMyUrl()),
              builder: (context, Object, child) {
                print('Platform is in build');
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      Object.item2== null
                          ? launchUrl(phoneNumber)
                          : launchUrl(object.item2!,
                              mode: LaunchMode.externalApplication);
                    },
                    icon: Object.item1 == null
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
                              image: AssetImage('assets/${object.item1}.png',),
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          iconSize: 25,
                  ),
                  );
              },
            ),
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
                    backgroundImage: AssetImage('assets/MayaElGebeily.jpeg'),
                    radius: 100,
                    ),
                    
                  ),


                  Consumer<MyProvider>(
                    builder: (context, value, child) {
                      print('Button is in build');
                      return ElevatedButton(onPressed: () {
                      value.changeName();
                    value.notifyListeners();}, 
                    child: Text('Change Name'),);
                    },),

                  Selector<MyProvider , String>(
                    selector: (p0, p1) => p1.name,                    builder: (context, value, child) {
                      print('Name is in build');
                      return Text(
                      value.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                    },
                    
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
                      return ContactChanelCard(
                          platform: myContacts.keys.toList()[index],
                          url: myContacts.values.toList()[index],
                          changeState : changeMyState()
                          );
                          
                          
                    },
                    shrinkWrap: true,
                    primary: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 20),
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

class MyProvider {
}

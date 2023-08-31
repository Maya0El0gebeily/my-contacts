import 'package:flutter/material.dart';
import 'package:my_contacts/my_provider';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactChanelCard extends StatelessWidget {
  String platform;
  String ?myPlatform;
  Uri url;
  bool clicked = false;
  Function changeState;



  ContactChanelCard({
    Key? key,
    required this.platform,
    required this.url,

  }) : super(key: key);

  @override
  State<ContactChanelCard> createState() => _ContactChanelCardState();
}

class _ContactChanelCardState extends State<ContactChanelCard> {
  double? myRaduis;
  @override
  Widget build(BuildContext context) {
    return 
        Consumer2<ActionIconProvider,SocialIconProvider>(
          builder: (context, value, iconData ,child) {
            print('Platform is inbuild');
            return 
           Padding(
            padding: const EdgeInsets.all(12.0),
            child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(myRaduis ?? 50),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 4,
                child: InkWell(
                  onDoubleTap:() {
                    value.setMyPlatform(widget.platform);
                    value.setMyUrl(widget.url);
                   // value.myPlatform = widget.platform;
                    //value.myUrl = widget.url;
        
                  },
                  onTap: ()  {
                    iconData.raduis == 50
                    ? {iconData.raduis = 20,
                      iconData.notifyListeners(),
                      myRaduis = iconData.raduis
                    
                     }
                    : {iconData.raduis = 50,
                    iconData.notifyListeners(),
                    myRaduis = iconData.raduis!
                    
                     };
                    launchUrl(widget.url, mode: LaunchMode.externalApplication);
                  },
                  child: Image(
                    image: AssetImage(
                    'assets/${widget.platform}.png',),
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover),
                ),
                ),
          );
          
        );
  }
}



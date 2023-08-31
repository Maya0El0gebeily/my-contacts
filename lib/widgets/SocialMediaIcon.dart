import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcon extends StatelessWidget {
  String SocialMedia;
  String socialMediaLinks;

  SocialMediaIcon({
    Key? key,
    required this.SocialMedia,
    required this.socialMediaLinks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 4,
            child: InkWell(
              onTap: () async {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              },
              child: Image(
                image: AssetImage('assets/$SocialMedia'),
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            )),
      ],
    );
  }
}

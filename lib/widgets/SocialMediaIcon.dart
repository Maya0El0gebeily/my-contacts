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
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/$SocialMedia'),
          radius: 40,
        ),
        onTap: () {
          launchUrl(Uri.parse(SocialMedia),
              mode: LaunchMode.externalApplication);
        },
      ),
    );
  }
}

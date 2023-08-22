import 'package:flutter/material.dart';
import 'package:my_contacts/my_contacts.dart';
import 'SocialMediaIcon.dart';

class ContactsGrid extends StatelessWidget {
  const ContactsGrid({
    super.key,
    required this.socialMedia,
  });

  final Map<String, String> socialMedia;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: socialMedia.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,),
          
      itemBuilder: (BuildContext context, index) {
        return ContactChanelCard(
          Platform :MyContacts.keys.toList()[index],
          Url: MyContacts.values.toList()[index],
        );
      },
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10),
    );
  }
}

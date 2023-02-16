import 'package:flutter/material.dart';
import '../model/user_model.dart';

TextStyle contactInfoTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.teal.shade900,
  fontWeight: FontWeight.w500,
);

Widget contactDetail(
    User user, Function openWebsite, Function openPhone, Function openEmail) {
  return Column(
    children: [
      GestureDetector(
        onTap: () => openWebsite(),
        child: ListTile(
          leading: const Icon(
            Icons.web,
            color: Colors.teal,
          ),
          title: Text(
            user.website,
            style: contactInfoTextStyle,
          ),
        ),
      ),
      GestureDetector(
        onTap: () => openPhone(),
        child: ListTile(
          leading: const Icon(
            Icons.phone,
            color: Colors.teal,
          ),
          title: Text(user.phone, style: contactInfoTextStyle),
        ),
      ),
      GestureDetector(
        onTap: () => openEmail(),
        child: ListTile(
          leading: const Icon(
            Icons.email,
            color: Colors.teal,
          ),
          title: Text(user.email, style: contactInfoTextStyle),
        ),
      ),
    ],
  );
}

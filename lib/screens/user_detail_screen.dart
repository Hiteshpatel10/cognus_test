import 'dart:ui';

import 'package:congnus_test/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api/api_constants.dart';

class UserDetailScreen extends StatefulWidget {
  final User user;
  const UserDetailScreen({required this.user, Key? key}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  late String avatarUrl;

  TextStyle contactInfoTextStyle = TextStyle(
    fontSize: 18.0,
    color: Colors.teal.shade900,
    fontWeight: FontWeight.w500,
  );

  TextStyle addressTextStyle = const TextStyle(
    fontSize: 18.0,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  void openEmail() async {
    final Uri url = Uri(
      scheme: 'mailto',
      path: widget.user.email,
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      errorMessage("Sorry! not able to open email");
    }
  }

  void openPhone() async {
    final Uri url = Uri(scheme: 'tel', path: widget.user.phone);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      errorMessage("Sorry! not able to open dialer");
    }
  }

  void openLocation() async {
    var url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${widget.user.address.geo.lat},${widget.user.address.geo.lng}');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      errorMessage("Sorry! not able to open location");
    }
  }

  void openWebsite() async {
    var url = Uri.parse('https://${widget.user.website}');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      errorMessage("Can't open the link");
    }
  }

  void errorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          const Icon(
            Icons.error_outline_outlined,
            color: Colors.white,
          ),
          const SizedBox(width: 4),
          Text(message),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      backgroundColor: Colors.deepOrange,
      duration: const Duration(seconds: 2),
    ));
  }

  @override
  void initState() {
    super.initState();
    avatarUrl =
        ApiConstants.avatarAPIBase + widget.user.name.replaceAll(' ', '+');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.user.name} profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Container
            Container(
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://i.pinimg.com/564x/2d/0f/79/2d0f79b6194ce739ee53e5ace7eb2d35.jpg"),
                    fit: BoxFit.cover),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  alignment: const Alignment(0.0, 4.5),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(avatarUrl),
                    radius: 60.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),

            // Name and Email Text
            Text(
              widget.user.name,
              style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.blueGrey,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            Text(
              widget.user.username,
              style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 10),

            // Company Details
            Container(
              width: double.infinity,
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        widget.user.company.name,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.teal.shade900,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.user.company.catchPhrase,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal.shade800,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.user.company.bs,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal.shade800,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => openWebsite(),
                        child: ListTile(
                          leading: const Icon(
                            Icons.web,
                            color: Colors.teal,
                          ),
                          title: Text(
                            widget.user.website,
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
                          title: Text(widget.user.phone,
                              style: contactInfoTextStyle),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => openEmail(),
                        child: ListTile(
                          leading: const Icon(
                            Icons.email,
                            color: Colors.teal,
                          ),
                          title: Text(widget.user.email,
                              style: contactInfoTextStyle),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //Address
            GestureDetector(
              onTap: () => openLocation(),
              child: ClipRect(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 25.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/location.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(widget.user.address.suite,
                                style: addressTextStyle),
                            Text(widget.user.address.street,
                                style: addressTextStyle),
                            Text(widget.user.address.city,
                                style: addressTextStyle),
                            Text(widget.user.address.zipcode,
                                style: addressTextStyle),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

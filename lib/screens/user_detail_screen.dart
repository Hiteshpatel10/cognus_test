import 'dart:ui';

import 'package:congnus_test/model/user_model.dart';
import 'package:congnus_test/shape/polygon.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api/api_constants.dart';
import '../widgets/address_detail.dart';
import '../widgets/company_detail.dart';
import '../widgets/contact_detail.dart';

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
              child: Container(
                alignment: const Alignment(0.0, 3.5),
                child: ClipShadowPath(
                  shadow: Shadow(
                    color: Colors.grey.withOpacity(0.8),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                  clipper: MyPolygon(),
                  child: Image.network(
                    avatarUrl,
                    width: 128,
                    height: 110,
                    fit: BoxFit.cover,
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

            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          companyDetail(widget.user.company),
                          //Contact Details
                          contactDetail(
                              widget.user, openWebsite, openPhone, openEmail),
                        ],
                      ),
                    ),
                  ),
                  const Positioned(
                    top: -35,
                    right: 15,
                    child: PhysicalModel(
                      color: Colors.black,
                      elevation: 15.0,
                      shape: BoxShape.circle,
                      child: CircleAvatar(
                        radius: 45.0,
                        backgroundColor: Colors.teal,
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            "Company \n Info",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Address
            addressDetail(widget.user.address, openLocation),
          ],
        ),
      ),
    );
  }
}

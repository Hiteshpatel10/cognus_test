import 'package:congnus_test/api/api_constants.dart';
import 'package:flutter/material.dart';

import '../shape/polygon.dart';

Widget userCard(String name, String email) {
  var avatarUrl = ApiConstants.avatarAPIBase + name.replaceAll(' ', '+');
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
    child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipShadowPath(
                shadow: Shadow(
                  color: Colors.grey.withOpacity(0.6),
                  blurRadius: 8,
                  offset: const Offset(0, 5),
                ),
                clipper: MyPolygon(),
                child: Image.network(
                  avatarUrl,
                  width: 70,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
        )),
  );
}

import 'dart:ui';
import 'package:flutter/material.dart';
import '../model/user_model.dart';

TextStyle addressTextStyle = const TextStyle(
  fontSize: 18.0,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

Widget addressDetail(Address address, Function openLocation) {
  return GestureDetector(
    onTap: () => openLocation(),
    child: ClipRect(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
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
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(address.suite, style: addressTextStyle),
                  Text(address.street, style: addressTextStyle),
                  Text('${address.city}, ${address.zipcode}',
                      style: addressTextStyle),
                  const SizedBox(height: 8),
                  const Text("Open the address -->"),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';

Widget tabCapsule(Function() searchUser) {
  return Container(
    width: 160,
    margin: const EdgeInsets.only(top: 32),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            color: Colors.grey,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'users',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: searchUser,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(
                Icons.search_sharp,
                size: 32,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

import 'package:congnus_test/model/user_model.dart';
import 'package:flutter/material.dart';

Widget companyDetail(Company company) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          company.name,
          style: TextStyle(
            fontSize: 22,
            color: Colors.teal.shade900,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          company.bs,
          style: TextStyle(
            fontSize: 16,
            color: Colors.teal.shade800,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          company.catchPhrase,
          style: TextStyle(
            fontSize: 16,
            color: Colors.teal.shade800,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

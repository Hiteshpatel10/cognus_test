import 'package:congnus_test/api/api_constants.dart';
import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  final String name;
  final String email;
  const UserCard({required this.name, required this.email, Key? key})
      : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  late String avatarUrl;

  @override
  void initState() {
    super.initState();
    avatarUrl = ApiConstants.avatarAPIBase + widget.name.replaceAll(' ', '+');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(avatarUrl),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              Text(
                widget.email,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              )
            ],
          )
        ],
      ),
    ));
  }
}
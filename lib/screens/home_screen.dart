import 'package:congnus_test/model/user_model.dart';
import 'package:congnus_test/widgets/user_card.dart';
import 'package:flutter/material.dart';

import '../api/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<User>? _userModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        centerTitle: true,
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: _userModel!.length,
                itemBuilder: (context, index) {
                  User user = _userModel![index];
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/user-detail',
                            arguments: user);
                      },
                      child: UserCard(name: user.name, email: user.email));
                },
              ),
            ),
    );
  }
}

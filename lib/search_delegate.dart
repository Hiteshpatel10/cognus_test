import 'package:flutter/material.dart';

import 'model/user_model.dart';

class UserSearchDelegate extends SearchDelegate<User> {
  final List<User> users;

  UserSearchDelegate(this.users);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        // ignore: prefer_const_constructors
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      // ignore: prefer_const_constructors
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, [] as User);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = users
        .where((user) => user.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final user = results[index];
        return ListTile(
          title: Text(user.name),
          subtitle: Text(user.email),
          onTap: () {
            close(context, user);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = users
        .where((user) => user.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final user = results[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: ListTile(
              title: Text(user.name),
              subtitle: Text(user.email),
              onTap: () {
                close(context, user);
                Navigator.pushNamed(context, '/user-detail', arguments: user);
              },
            ),
          ),
        );
      },
    );
  }
}

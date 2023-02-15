import 'package:flutter/material.dart';

import 'model/user_model.dart';

class UserListProvider extends ChangeNotifier {
  User _userList = [] as User;

  User get userList => _userList;

  set userList(User list) {
    _userList = list;
    notifyListeners();
  }
}

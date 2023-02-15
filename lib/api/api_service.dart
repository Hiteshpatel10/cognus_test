import 'dart:convert';
import 'dart:developer';

import 'package:congnus_test/api/api_constants.dart';
import 'package:congnus_test/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<User>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.userAPI);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        List<User> model = jsonData.map((e) => User.fromJson(e)).toList();
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

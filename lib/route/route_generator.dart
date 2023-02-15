import 'package:congnus_test/model/user_model.dart';
import 'package:congnus_test/screens/home_screen.dart';
import 'package:congnus_test/screens/user_detail_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case '/user-detail':
        if (args is User) {
          return MaterialPageRoute(
              builder: (_) => UserDetailScreen(user: args));
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('No route'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'Error 404! Route Not Found',
            style: TextStyle(color: Colors.red, fontSize: 18.0),
          ),
        ),
      );
    });
  }
}

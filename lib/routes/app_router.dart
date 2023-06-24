import 'package:flutter/material.dart';
import 'package:pdm/screens/home/home.dart';
import 'package:pdm/screens/home/intro.dart';
import 'package:pdm/screens/home/user_info.dart';
import 'package:pdm/screens/home/user_list.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Home.routeName:
        return MaterialPageRoute(builder: (_) => Home());
      case UserList.routeName:
        return MaterialPageRoute(builder: (_) => UserList());
      case UserInfo.routeName:
        final args = settings.arguments as Map<String, dynamic>;
        final userId = args['id'];
        return MaterialPageRoute(builder: (_) => UserInfo(userId: userId));
      case '/intro':
           return MaterialPageRoute(builder: (_) => Intro());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:pdm/models/user.dart';

class UserProvider with ChangeNotifier {
  User _user = User(id: 0, name: '', email: '');

  User get user => _user;

  set user(User newUser) {
    _user = newUser;
    notifyListeners();
  }

  void updateUser(User newUser) {
    user = newUser;
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pdm/config/config.dart';
import 'package:pdm/models/user.dart';

class ApiService {
  static const String _baseUrl = '${Config.apiUrl}/users';

  static Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> usersJson = jsonDecode(response.body);
      return usersJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  static Future<User> getUser(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/$id'));

    if (response.statusCode == 200) {
      final dynamic userJson = jsonDecode(response.body);
      return User.fromJson(userJson);
    } else {
      throw Exception('Failed to load user');
    }
  }

  static Future<void> updateUser(User user) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/${user.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user');
    }
  }
}
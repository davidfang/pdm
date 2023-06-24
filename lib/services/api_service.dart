import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pdm/config/config.dart';
import 'package:pdm/models/user.dart';

class ApiService {
  static const String _baseUrl = Config.apiUrl;

  static Future<List<User>> getUsers() async {
    final resp = await http.get(Uri.parse("$_baseUrl/users"));
    if (resp.statusCode == 200) {
      final res = jsonDecode(resp.body);
      final List<dynamic> usersJson = res["data"];
      return usersJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  static Future<User> getUser(num id) async {
    final response = await http.get(Uri.parse("$_baseUrl/user/$id"));

    if (response.statusCode == 200) {
      final dynamic userJson = jsonDecode(response.body);
      return User.fromJson(userJson["data"]);
    } else {
      throw Exception('Failed to load user');
    }
  }

  static Future<void> updateUser(User user) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/user/${user.id}'),
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

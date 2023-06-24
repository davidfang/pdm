import 'package:flutter/material.dart';
import 'package:pdm/models/user.dart';
import 'package:pdm/services/api_service.dart';

class UserInfo extends StatefulWidget {
  static const routeName = '/userInfo';

  final num userId;

  UserInfo({required this.userId});

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  late Future<User> _futureUser;

  @override
  void initState() {
    super.initState();
    _futureUser = ApiService.getUser(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      body: FutureBuilder<User>(
        future: _futureUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final user = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${user.name}'),
                  Text('Email: ${user.email}'),
                  Text("Id: ${user.id}"),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

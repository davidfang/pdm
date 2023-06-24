import 'package:flutter/material.dart';
import 'package:pdm/models/user.dart';
import 'package:pdm/screens/home/user_info.dart';
import 'package:pdm/services/api_service.dart';

class UserList extends StatefulWidget {
  static const routeName = '/userList';
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UserList'),
      ),
      body: Center(
        child: FutureBuilder(
          future: ApiService.getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final users = snapshot.data as List<User>; // 检查类型
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text(user.name), // 避免空指针异常
                    subtitle: Text(user.email), // 避免空指针异常
                    onTap: () {
                      Navigator.pushNamed(context, UserInfo.routeName,
                          arguments: {"id":user.id});
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pdm/models/user.dart';
import 'package:pdm/providers/user_provider.dart';
import 'package:pdm/routes/app_router.dart';
import 'package:pdm/screens/home/home.dart';
import 'package:pdm/screens/home/intro.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: MyHomePage(),
        home: Home(),
        onGenerateRoute: AppRouter.generateRoute,
         initialRoute: '/intro',
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'User ID: ${userProvider.user.id}',
            ),
            Text(
              'User Name: ${userProvider.user.name}',
            ),
            Text(
              'User Email: ${userProvider.user.email}',
            ),
            ElevatedButton(
              onPressed: () {
                final newUser = User(
                  id: 1,
                  name: 'John Doe',
                  email: 'johndoe@example.com',
                );
                userProvider.updateUser(newUser);
              },
              child: Text('Update User'),
            ),
          ],
        ),
      ),
    );
  }
}

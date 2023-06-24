import 'package:flutter/material.dart';
import 'package:pdm/screens/home/project_list.dart';
import 'package:pdm/screens/home/user_list.dart';

class Home extends StatefulWidget {
  static const routeName = '/';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 2;
  final List<Nav> _widgetOptions = <Nav>[
    Nav(icon: const Icon(Icons.add), label: '新建'),
    Nav(icon: const Icon(Icons.open_in_browser), label: '打开'),
    Nav(icon: const Icon(Icons.folder), label: '项目'),
    Nav(icon: const Icon(Icons.people), label: '用户列表')
  ];

  void _onItemTapped(int index) {
    if (index == 3) {
      Navigator.pushNamed(context, UserList.routeName);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Widget _tappedContent() {
    return ProjectList(projects: []);
    // return Expanded(
    //   child: Center(
    //     child: Text(_widgetOptions[_selectedIndex].label),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        NavigationRail(
          leading: ClipOval(
            child: Container(
              width: 60,
              height: 60,
              color: Colors.blueGrey,
              child: const Center(
                child: Text('pdm'),
              ),
            ),
          ),
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          labelType: NavigationRailLabelType.all,
          destinations: _widgetOptions
              .map((w) => NavigationRailDestination(
                    icon: w.icon,
                    label: Text(w.label),
                  ))
              .toList(),
        ),
        SizedBox(
          width: 3,
        ),
        _tappedContent(),
      ]),
    );
  }
}

class Nav {
  final Icon icon;
  final String label;

  Nav({required this.icon, required this.label});
}

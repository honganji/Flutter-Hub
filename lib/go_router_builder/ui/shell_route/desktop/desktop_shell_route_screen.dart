import 'package:flutter/material.dart';

import '../../../route/router.dart';
import '../sub_screens/home/home_route.dart';
import '../sub_screens/setting/setting_route.dart';
import '../sub_screens/users/users_route.dart';

class DesktopShellRouteScreen extends StatefulWidget {
  const DesktopShellRouteScreen(this.child, {super.key});
  final Widget child;

  @override
  State<DesktopShellRouteScreen> createState() =>
      _DesktopShellRouteScreenState();
}

class _DesktopShellRouteScreenState extends State<DesktopShellRouteScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        const HomeRoute().go(context);
      case 1:
        const SettingRoute().go(context);
      case 2:
        const UsersRoute().go(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desktop Flutter Hub'),
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../route/router.dart';

class MobileShellRouteScreen extends StatefulWidget {
  const MobileShellRouteScreen(this.child, {super.key});
  final Widget child;

  @override
  State<MobileShellRouteScreen> createState() => _MobileShellRouteScreenState();
}

class _MobileShellRouteScreenState extends State<MobileShellRouteScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        const HomeRoute().go(context);
        break;
      case 2:
        const SettingRoute().go(context);
        break;
      case 3:
        const UsersRouteData().go(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Flutter Hub'),
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
            icon: Icon(Icons.info),
            label: 'User',
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}

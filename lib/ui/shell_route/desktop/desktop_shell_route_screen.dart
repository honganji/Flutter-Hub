import 'package:flutter/material.dart';

import '../../../route/router.dart';

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
        break;
      case 1:
        const AboutUsRoute().go(context);
        break;
      case 2:
        const SettingRoute().go(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desktop Flutter Hub'),
      ),
      body: Expanded(child: widget.child),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}

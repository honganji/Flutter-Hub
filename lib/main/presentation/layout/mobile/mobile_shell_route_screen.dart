import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/usecase/title/title_usecase.dart';
import '../../../config/route/router.dart';
import '../../pages/home/home_route.dart';
import '../../pages/setting/setting_route.dart';
import '../../pages/users/users_route.dart';

class MobileShellRouteScreen extends HookConsumerWidget {
  const MobileShellRouteScreen(this.child, {super.key});
  final Widget child;

  void _onItemTapped(int newIndex, BuildContext context) {
    switch (newIndex) {
      case 0:
        const HomeRoute().go(context);
      case 1:
        const SettingRoute().go(context);
      case 2:
        const UsersRoute().go(context);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titlePro = ref.watch(titleUsecaseProvider);
    final indexState = useState(0);
    return Scaffold(
      appBar: AppBar(
        title: Text(titlePro.title),
      ),
      body: child,
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
        onTap: (index) {
          indexState.value = index;
          _onItemTapped(index, context);
        },
        currentIndex: indexState.value,
      ),
    );
  }
}

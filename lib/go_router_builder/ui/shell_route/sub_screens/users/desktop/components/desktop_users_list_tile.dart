import 'package:flutter/material.dart';

import '../../../../../../route/router.dart';
import '../../sub_sreens/user_route.dart';

class DesktopUsersListTile extends StatelessWidget {
  const DesktopUsersListTile(this.index, {super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: InkWell(
        onTap: () {
          UserRoute('user$index', id: index).go(context);
        },
        child: Text('User $index'),
      ),
    );
  }
}

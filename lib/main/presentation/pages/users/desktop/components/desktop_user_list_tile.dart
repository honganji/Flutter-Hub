import 'package:flutter/material.dart';

import '../../../../../config/route/router.dart';
import '../../sub_sreens/user_route.dart';

class DesktopUserListTile extends StatelessWidget {
  const DesktopUserListTile(this.index, {super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: InkWell(
        onTap: () {
          UserRouteData(null, id: index).go(context);
        },
        child: Text('User $index'),
      ),
    );
  }
}

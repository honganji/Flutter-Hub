import 'package:flutter/material.dart';

import 'components/desktop_user_list_tile.dart';

class DesktopUserScreen extends StatelessWidget {
  const DesktopUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return DesktopUserListTile(
            index,
          );
        },
      ),
    );
  }
}

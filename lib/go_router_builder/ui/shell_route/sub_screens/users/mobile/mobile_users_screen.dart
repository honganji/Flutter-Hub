import 'package:flutter/material.dart';

import 'components/mobile_users_list_tile.dart';

class MobileUsersScreen extends StatelessWidget {
  const MobileUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return MobileUsersListTile(
            index,
          );
        },
      ),
    );
  }
}

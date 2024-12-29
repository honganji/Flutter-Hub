import 'package:flutter/material.dart';

class DesktopUserScreen extends Page<void> {
  const DesktopUserScreen(this.id, this.name, {super.key});
  final int id;
  final String? name;

  @override
  Route<void> createRoute(BuildContext context) {
    return DialogRoute(
      context: context,
      settings: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User Detail'),
          content: Column(
            children: [
              Text('User $id'),
              Text('name $name'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

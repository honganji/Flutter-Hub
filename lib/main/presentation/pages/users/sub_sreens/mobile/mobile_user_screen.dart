import 'package:flutter/material.dart';

class MobileUserScreen extends Page<void> {
  const MobileUserScreen(this.id, {super.key});
  final int id;

  @override
  Route<void> createRoute(BuildContext context) {
    return DialogRoute(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User Detail'),
          content: Text('User $id'),
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

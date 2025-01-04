import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'providers/shared_preference_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferenceProvider.overrideWithValue(
          await SharedPreferences.getInstance(),
        ),
      ],
      child: const App(),
    ),
  );
}

import 'package:flutter/material.dart';

import 'constants.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const FacebookTaskApp());
}

class FacebookTaskApp extends StatelessWidget {
  const FacebookTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook Task',
      theme: ThemeData(
        scaffoldBackgroundColor: kWhite,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}


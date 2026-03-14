import 'dart:async';

import 'package:flutter/material.dart';

import '../constants.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Image.asset('facebook/App Rounded Logo.png', width: 72, height: 72),
            const Spacer(),
            const Text(
              'From',
              style: TextStyle(color: kGray, fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 4),
            Image.asset('facebook/Meta Logo.png', width: 95),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

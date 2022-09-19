import 'dart:async';

import 'package:flutter/material.dart';

import '../../../service/app_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 500), () {
      AppRouter.navigatorKey.currentState?.pushReplacementNamed(AppRoutes.login);
    });
    return const Scaffold(
      body: Center(
        child: Text('This is splash screen'),
      ),
    );
  }
}

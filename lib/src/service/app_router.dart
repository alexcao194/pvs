import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../presentation/screen/home_screen/home_screen.dart';
import '../presentation/screen/splash_screen/splash_screen.dart';
import '../presentation/screen/user_screen/forgot_password_screen.dart';
import '../presentation/screen/user_screen/login_screen.dart';
import '../presentation/screen/user_screen/registry_screen.dart';
import '../presentation/screen/user_screen/signup_screen.dart';

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case AppRoutes.registry:
        return MaterialPageRoute(builder: (_) => const RegistryScreen());
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              appBar: AppBar(),
              body: const Center(
                  child: Text('Fallback')),
            ));
    }
  }
}

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String signUp = '/sign_up';
  static const String login = '/login';
  static const String registry = '/registry';
  static const String forgotPassword = '/forgot_password';
}
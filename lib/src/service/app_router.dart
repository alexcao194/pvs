import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/quiz_screen.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/result_screen.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/test_page/bloc/test_screen/test_creen.dart';
import 'package:pvs/src/presentation/screen/messenger_screen/messenger_screen.dart';
import 'package:pvs/src/presentation/screen/profile_screen/profile_screen.dart';
import 'package:pvs/src/presentation/screen/splash_screen/splash_screen.dart';

import '../presentation/screen/home_screen/home_screen.dart';
import '../presentation/screen/user_screen/connect_screen.dart';
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
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case AppRoutes.registry:
        return MaterialPageRoute(builder: (_) => const RegistryScreen());
      case AppRoutes.connect:
        return MaterialPageRoute(builder: (_) => ConnectScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case AppRoutes.quiz:
        return MaterialPageRoute(builder: (_) => QuizScreen());
      case AppRoutes.messsenger:
        return MaterialPageRoute(builder: (_) => const MessengerScreen());
      case AppRoutes.result:
        return MaterialPageRoute(builder: (_) => const ResultScreen());
      case AppRoutes.test:
        return MaterialPageRoute(builder: (_) => const TestScreen());
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
  static const String connect = '/connect';
  static const String home = '/home';
  static const String signUp = '/sign_up';
  static const String login = '/login';
  static const String registry = '/registry';
  static const String forgotPassword = '/forgot_password';
  static const String profile = '/profile';
  static const String quiz = '/quiz';
  static const String messsenger = '/messenger';
  static const String result = '/result';
  static const String test = '/test';
}
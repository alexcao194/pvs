import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/presentation/screen/user_screen/bloc/user_bloc/user_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(UserEventRelogin(context: context));
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text('Ứng dụng được phát triển bởi Cao Việt Đức\nAlexcao',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/presentation/screen/home_screen/widget/stl/header_bar.dart';
import 'package:pvs/src/service/app_router.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          HeaderBar(
            height: size.height * 0.1,
            action: const Text('12/24'),
            actionOnPress: () {},
            leading: const Icon(Icons.arrow_back),
            leadingOnPress: () {
              AppRouter.navigatorKey.currentState?.pop();
            },
          )
        ],
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(
      color: AppThemes.theme.primaryColor,
    ));
  }
}


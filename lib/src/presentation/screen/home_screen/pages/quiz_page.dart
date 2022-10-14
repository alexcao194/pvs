import 'package:flutter/material.dart';
import 'package:pvs/src/config/theme.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Quiz Screen')),
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


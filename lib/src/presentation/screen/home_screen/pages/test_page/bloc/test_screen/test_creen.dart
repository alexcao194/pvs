import 'package:flutter/material.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/fill_blank_quiz.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FillBlankQuiz(),
    );
  }
}

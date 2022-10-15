import 'package:flutter/material.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/image_quiz.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/text_quiz.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
            color: AppThemes.theme.primaryColor50,
            child: const TextQuiz(mode : QuizMode.multiChoice)
        ),
      ),
    );
  }
}
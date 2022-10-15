import 'package:flutter/material.dart';
import 'package:pvs/src/constant/app_path.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/quiz_multi_choice.dart';import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/quiz_single_choice.dart';

enum QuizMode { multiChoice, singleChoice }

class ImageQuiz extends StatelessWidget {
  const ImageQuiz({Key? key, required this.mode}) : super(key: key);

  final QuizMode mode;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                  child: Text('Nội dung câu hỏi',
                      style: TextStyle(color: Colors.white, fontSize: 22))),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                  height: size.height * 0.3,
                  child: Image.asset(AppPath.a2Background, fit: BoxFit.cover)),
            ),
            mode == QuizMode.multiChoice
                ? const QuizMultiChoice()
                : const QuizSingleChoice()
          ],
        ),
      ),
    );
  }
}






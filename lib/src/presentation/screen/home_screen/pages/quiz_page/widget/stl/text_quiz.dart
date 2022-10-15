import 'package:flutter/material.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/image_quiz.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/quiz_multi_choice.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/quiz_single_choice.dart';

class TextQuiz extends StatelessWidget {
  const TextQuiz({Key? key, required this.mode}) : super(key: key);

  final QuizMode mode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
                child: Text('Nội dung câu hỏi',
                    style: TextStyle(color: Colors.white, fontSize: 22))),
          ),
        ),
        Expanded(
          child: mode == QuizMode.multiChoice
              ? const SingleChildScrollView(
                  physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                  child: QuizMultiChoice())
              : const QuizSingleChoice(),
        )
      ],
    );
  }
}

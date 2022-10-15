import 'package:flutter/material.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/answer_card.dart';

class QuizSingleChoice extends StatelessWidget {
  const QuizSingleChoice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Expanded(
                    child: AnswerCard(title: 'Đáp án 1', color: Colors.green)),
                Expanded(
                    child: AnswerCard(title: 'Đáp án 2', color: Colors.pink)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Expanded(
                    child: AnswerCard(title: 'Đáp án 3', color: Colors.blue)),
                Expanded(
                    child: AnswerCard(title: 'Đáp án 4', color: Colors.cyan)),
              ],
            ),
          ),
          const SizedBox(height: 8.0)
        ],
      ),
    );
  }
}
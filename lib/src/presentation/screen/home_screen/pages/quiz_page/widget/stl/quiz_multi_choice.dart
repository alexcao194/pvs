import 'package:flutter/material.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/multi_choice_button.dart';

class QuizMultiChoice extends StatelessWidget {
  const QuizMultiChoice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MultiChoiceButton(title: 'Đáp án 1', color: Colors.pink),
        MultiChoiceButton(title: 'Đáp án 1', color: Colors.green),
        MultiChoiceButton(title: 'Đáp án 1', color: Colors.blue),
        MultiChoiceButton(title: 'Đáp án 1', color: Colors.deepOrange),
        MultiChoiceButton(title: 'Đáp án 1', color: Colors.pink),
        MultiChoiceButton(title: 'Đáp án 1', color: Colors.green),
        MultiChoiceButton(title: 'Đáp án 1', color: Colors.blue),
        MultiChoiceButton(title: 'Đáp án 1', color: Colors.deepOrange),
        SizedBox(height: 8.0)
      ],
    );
  }
}

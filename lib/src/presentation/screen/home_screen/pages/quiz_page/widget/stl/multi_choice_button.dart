import 'package:flutter/material.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/answer_card.dart';


class MultiChoiceButton extends StatelessWidget {
  const MultiChoiceButton({
    Key? key,
    required this.color,
     required this.title
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
            value: 1,
            activeColor: color,
            groupValue: 1,
            onChanged: (value) {}
        ),
        Expanded(child: AnswerCard(title: title, color: color)),
      ],
    );
  }
}

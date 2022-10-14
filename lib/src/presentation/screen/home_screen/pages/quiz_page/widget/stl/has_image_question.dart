import 'package:flutter/material.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/answer_card.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/multi_choice_button.dart';

class HasImageQuestionSingleChoice extends StatelessWidget {
  const HasImageQuestionSingleChoice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Expanded(
          flex: 3,
          child: Center(child: Text('Nội dung câu hỏi', style: TextStyle(color: Colors.white, fontSize: 22))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SizedBox(
              height: size.height * 0.3,
              child: Image.asset('')
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Expanded(child: AnswerCard(title: 'Đáp án 1', color: Colors.green)),
                    Expanded(child: AnswerCard(title: 'Đáp án 2', color: Colors.pink)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Expanded(child: AnswerCard(title: 'Đáp án 3', color: Colors.blue)),
                    Expanded(child: AnswerCard(title: 'Đáp án 4', color: Colors.cyan)),
                  ],
                ),
              ),
              const SizedBox(height: 8.0)
            ],
          ),
        )
      ],
    );
  }
}

class HasImageQuestionMultiChoice extends StatelessWidget {
  const HasImageQuestionMultiChoice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Expanded(
          flex: 3,
          child: Center(child: Text('Nội dung câu hỏi', style: TextStyle(color: Colors.white, fontSize: 22))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SizedBox(
              height: size.height * 0.3,
              child: Image.asset('')
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            children: const [
              Expanded(child: MultiChoiceButton(title: 'Đáp án 1', color: Colors.pink)),
              Expanded(child: MultiChoiceButton(title: 'Đáp án 1', color: Colors.green)),
              Expanded(child: MultiChoiceButton(title: 'Đáp án 1', color: Colors.blue)),
              Expanded(child: MultiChoiceButton(title: 'Đáp án 1', color: Colors.deepOrange)),
              SizedBox(height: 8.0)
            ],
          ),
        )
      ],
    );
  }
}


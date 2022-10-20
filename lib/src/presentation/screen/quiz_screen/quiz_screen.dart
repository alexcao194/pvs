import 'package:flutter/material.dart';
import 'package:pvs/src/presentation/screen/quiz_screen/widget/question_box.dart';
import 'package:pvs/src/presentation/screen/quiz_screen/widget/question_header_bar.dart';
import 'package:alex_core/alex_core.dart';

enum QuizType {
  fillBank,
  mutilChoice,
}

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const QuestionHeaderBar(),
            buildBody(QuizType.fillBank),
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(24.0),
        child: InkWellButton(
          primaryColor: Colors.red,
          height: 60,
          radius: 10.0,
          isActive: true,
          child: Text('Submit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white)),
        ),
      ),
    );
  }

  Widget buildBody(QuizType quizType) {
    switch(quizType) {
      case QuizType.fillBank:
        return Column(
          children: [
            const Text('Hoàn thành câu',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: QuestionBox(),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          children: [
                            TextSpan(text: 'Flutter là một framework ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                            WidgetSpan(child: BlankBox()),
                            TextSpan(text: 'Sử dụng ngôn ngữ lập trình ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                            WidgetSpan(child: BlankBox()),
                            TextSpan(text: 'Flutter là một framework ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                            WidgetSpan(child: BlankBox()),
                            TextSpan(text: 'Sử dụng ngôn ngữ lập trình ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                            WidgetSpan(child: BlankBox()),
                            TextSpan(text: 'Flutter là một framework ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                            WidgetSpan(child: BlankBox()),
                            TextSpan(text: 'Sử dụng ngôn ngữ lập trình ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                            WidgetSpan(child: BlankBox()),
                            TextSpan(text: 'Flutter là một framework.', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                          ]
                      ),
                    )                    ],
                ),
              ),
            )
          ],
        );
        break;
      case QuizType.mutilChoice:
        return Column(
          children: const [
            Text('multi choice')
          ],
        );
    }
  }

}

class BlankBox extends StatelessWidget {
  const BlankBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 60,
        height: 40,
        child: TextField(
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}



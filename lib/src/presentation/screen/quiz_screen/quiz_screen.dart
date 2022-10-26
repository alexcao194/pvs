import 'package:flutter/material.dart';
import 'package:pvs/src/presentation/screen/quiz_screen/widget/blank_box.dart';
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          buildBody(QuizType.mutilChoice, size),
          const QuestionHeaderBar(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: InkWellButton(
          primaryColor: Colors.red,
          height: 60,
          radius: 10.0,
          isActive: true,
          onTap: () {

          },
          child: const Text('Submit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white)),
        ),
      ),
    );
  }

  Widget buildBody(QuizType quizType, Size size) {
    switch(quizType) {
      case QuizType.fillBank:
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.08),
              const Text('Hoàn thành câu',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: QuestionBox(
                  content: Center(
                    child: Text('Điền từ còn thiếu'),
                  ),
                ),
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
                        text: const TextSpan(
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
                              WidgetSpan(child: BlankBox()),
                              TextSpan(text: 'Sử dụng ngôn ngữ lập trình ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                              WidgetSpan(child: BlankBox()),
                              TextSpan(text: 'Flutter là một framework.', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
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
          ),
        );
      case QuizType.mutilChoice:
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.08),
              const Text('Chọn đáp án đúng',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: QuestionBox(
                  content: Center(
                    child: Text('X + 1 = 2 => X = ?'),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Row(
                children: [
                  Expanded(
                    child: InkWellButton(
                      height: size.height * 0.1,
                      backgroundColor: Colors.red,
                      primaryColor: Colors.red,
                      radius: 10.0,
                      onTap: () {},
                      child: const Text('Đáp án 1'),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: InkWellButton(
                      height: size.height * 0.1,
                      backgroundColor: Colors.red,
                      primaryColor: Colors.red,
                      onTap: () {

                      },
                      radius: 10.0,
                      child: const Text('Đáp án 2'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: InkWellButton(
                      height: size.height * 0.1,
                      backgroundColor: Colors.red,
                      primaryColor: Colors.red,
                      radius: 10.0,
                      onTap: () {},
                      child: const Text('Đáp án 3'),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: InkWellButton(
                      height: size.height * 0.1,
                      backgroundColor: Colors.red,
                      primaryColor: Colors.red,
                      radius: 10.0,
                      onTap: () {},
                      child: const Text('Đáp án 4'),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
    }
  }

}



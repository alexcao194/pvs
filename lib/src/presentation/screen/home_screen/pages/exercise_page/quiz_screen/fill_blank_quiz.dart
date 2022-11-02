import 'package:flutter/material.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/widget/blank_box.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/widget/question_box.dart';

class FillBlankQuiz extends StatelessWidget {
  const FillBlankQuiz({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
  }
}



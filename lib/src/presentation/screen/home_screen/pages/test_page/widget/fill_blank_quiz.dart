import 'package:alex_core/alex_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/widget/blank_box.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/widget/question_box.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/widget/question_header_bar.dart';

import '../bloc/test_bloc.dart';

class FillBlankQuiz extends StatelessWidget {
  const FillBlankQuiz({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<TestBloc, TestState>(
      builder: (context, testState) {
        return Stack(
          children: [
            buildBody(size, testState),
            SizedBox(
              height: size.height,
              child: Column(
                children: [
                  const QuestionHeaderBar(),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: InkWellButton(
                      primaryColor: Colors.red,
                      height: 60,
                      radius: 10.0,
                      isActive: true,
                      onTap: () {},
                      child: const Text('Submit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white)),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }

  SingleChildScrollView buildBody(Size size, TestState testState) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.08),
            const Text('Hoàn thành câu', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
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
                      text: TextSpan(
                          children: testState is TestStateGenerateDone
                              ? testState.test
                          : [
                            const WidgetSpan(child: CircularProgressIndicator())
                          ]
                      ),
                    ),
                    SizedBox(height: size.height * 0.04)
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }
}



import 'package:alex_core/alex_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/widget/question_box.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/widget/question_header_bar.dart';

import '../../../../../bloc/lessons_bloc/lessons_bloc.dart';
import '../bloc/test_bloc/test_bloc.dart';

class FillBlankQuiz extends StatelessWidget {
  FillBlankQuiz({
    Key? key,
  }) : super(key: key);

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<TestBloc, TestState>(
      builder: (context, testState) {
        return BlocBuilder<LessonsBloc, LessonsState>(
          builder: (context, lessonsState) {
            return Stack(
                  children: [
                    PageView.builder(
                      controller: pageController,
                      physics: const ScrollPhysics(
                        parent: NeverScrollableScrollPhysics()
                      ),
                      itemCount: testState is TestStateGenerateDone ? testState.countTest : 0,
                      itemBuilder: (context, index) {
                        return buildBody(size, testState, index, context, lessonsState);
                      },
                    ),
                    const QuestionHeaderBar()
                  ],
                );
          },
        );
      },
    );
  }

  Widget buildBody(Size size, TestState testState, int test, BuildContext context, LessonsState lessonsState) {
    return Stack(
      children: [
        SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
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
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: testState is TestStateGenerateDone
                                ? testState.test[test]
                                : [
                              const CircularProgressIndicator()
                            ]
                          ),
                          SizedBox(height: size.height * 0.04)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        Column(
          children: [
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: InkWellButton(
                primaryColor: testState is TestStateGenerateDone ? Colors.red : Colors.black12,
                height: 60,
                radius: 10.0,
                isActive: true,
                onTap: () {
                  if(testState is TestStateGenerateDone) {
                    BlocProvider.of<TestBloc>(context).add(TestEventSubmit(
                        pageController: pageController,
                        test: test,
                        context: context,
                        totalTest: testState.countTest,
                        controllers: testState.controllers[test],
                        lesson: 'lesson_${lessonsState.pickedLesson}'
                    )
                    );
                  }
                },
                child: const Text('Submit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white)),
              ),
            )
          ],
        )
      ],
    );
  }
}





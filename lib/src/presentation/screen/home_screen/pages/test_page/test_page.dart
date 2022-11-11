import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/widget/list_question.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/test_page/bloc/test_bloc/test_bloc.dart';
import 'package:pvs/src/service/app_router.dart';

import 'bloc/test_infor_bloc/test_infor_bloc.dart';


class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestInforBloc, TestInforState>(
      builder: (context, testInforState) {
        return BlocBuilder<TestBloc, TestState>(
          builder: (context, testState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListQuestion(
                      description: testInforState.test.desciption!,
                      label: testInforState.test.name!,
                      result: testInforState.test.hasDone! ? "Xong" : "",
                      onTap: testInforState.test.hasDone!
                        ? () {}
                        : () {
                        BlocProvider.of<TestBloc>(context).add(const TestEventGet(lesson: 'lesson_1'));
                        AppRouter.navigatorKey.currentState?.pushNamed(AppRoutes.test);
                      },
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

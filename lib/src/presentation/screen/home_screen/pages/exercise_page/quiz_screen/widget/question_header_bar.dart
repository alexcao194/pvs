import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/bloc/quiz_result_bloc/quiz_result_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/test_page/bloc/test_infor_bloc/test_infor_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/widget/stl/header_bar.dart';
import 'package:pvs/src/service/app_router.dart';
import 'package:pvs/src/service/shared_preferences.dart';

import '../../../../../../bloc/lessons_bloc/lessons_bloc.dart';

class QuestionHeaderBar extends StatelessWidget {
  const QuestionHeaderBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonsBloc, LessonsState>(
      builder: (context, lessonsState) {
        return HeaderBar(
          headerType: HeaderType.full,
          backgroundColor: Colors.white,
          leading: Row(
            children: const [Icon(Icons.heart_broken), Text('4')],
          ),
          title: Expanded(
            child: Container(
              height: 15,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Stack(
                children: [
                  Container(
                    height: 15,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ],
              ),
            ),
          ),
          action: IconButton(
            icon: const Icon(Icons.cancel_outlined),
            onPressed: () {
              BlocProvider.of<TestInforBloc>(context).add(TestInforEventGet(lesson: 'lesson_${lessonsState.currentLesson}'));
              BlocProvider.of<QuizResultBloc>(context).add(QuizResultEventGet(id: Prefs.get('id'), lesson: 'lesson_${lessonsState.currentLesson}'));
              AppRouter.navigatorKey.currentState?.pop();
            },
          ),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/presentation/bloc/lessons_bloc/lessons_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/bloc/quiz_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/widget/list_question.dart';
import 'package:pvs/src/service/app_router.dart';
import 'package:pvs/src/service/stream_socket.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, quizState) {
        return BlocBuilder<LessonsBloc, LessonsState>(
          builder: (context, lessonsState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListQuestion(
                      description: 'Một vài mô tả',
                      label: 'Bộ quiz thử nghiệm',
                      onTap: () {
                        if (!StreamSocket.hasInit) {
                          StreamSocket.init();
                          BlocProvider.of<QuizBloc>(context)
                              .add(const QuizEventListen());
                          StreamSocket.hasInit = true;
                        }
                        BlocProvider.of<QuizBloc>(context).add(
                            QuizEventGetQuestion(
                                lesson:'lesson_${lessonsState.currentLesson}'));
                        AppRouter.navigatorKey.currentState
                            ?.pushNamed(AppRoutes.quiz);
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

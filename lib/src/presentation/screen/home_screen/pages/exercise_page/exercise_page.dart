import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/presentation/bloc/lessons_bloc/lessons_bloc.dart';
import 'package:pvs/src/service/app_router.dart';
import 'package:pvs/src/service/stream_socket.dart';

import 'bloc/quiz_bloc.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, quizState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: const [
                ListQuestion()
              ],
            ),
          ),
        );
      },
    );
  }
}

class ListQuestion extends StatelessWidget {
  const ListQuestion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonsBloc, LessonsState>(
      builder: (context, lessonsState) {
        return GestureDetector(
          onTap: () {
            if(!StreamSocket.hasInit) {
              StreamSocket.init();
              BlocProvider.of<QuizBloc>(context).add(const QuizEventListen());
              StreamSocket.hasInit = true;
            }
            BlocProvider.of<QuizBloc>(context).add(QuizEventGetQuestion(
                lesson: 'lesson_${lessonsState.currentLesson}'));
            AppRouter.navigatorKey.currentState?.pushNamed(AppRoutes.quiz);
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                color: const Color.fromARGB(255, 240, 240, 240),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0) +
                          const EdgeInsets.symmetric(vertical: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: Container(
                          color: Colors.green,
                          height: 60,
                          width: 60,
                        ),
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Bộ câu hỏi thử nghiệm',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          Container(
                              height: 1.0, width: 100.0, color: Colors.white10),
                          const Text('Đây là vài dòng mô tả về bộ câu hỏi này')
                        ]),
                  ],
                ),
              )),
        );
      },
    );
  }
}

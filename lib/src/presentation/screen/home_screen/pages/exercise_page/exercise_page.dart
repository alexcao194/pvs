import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/presentation/bloc/lessons_bloc/lessons_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/bloc/quiz_bloc/quiz_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/bloc/quiz_result_bloc/quiz_result_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/widget/list_question.dart';
import 'package:pvs/src/service/app_router.dart';
import 'package:pvs/src/service/stream_socket.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, quizState) {
        return BlocBuilder<QuizResultBloc, QuizResultState>(
          builder: (context, quizResultState) {
            return BlocBuilder<QuizResultBloc, QuizResultState>(
              builder: (context, quizResulttate) {
                return BlocBuilder<LessonsBloc, LessonsState>(
                  builder: (context, lessonsState) {
                    return SizedBox(
                      width: double.infinity,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Ôn tập kiến thức', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27, color: Colors.red)),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Thời gian ", style: TextStyle(fontSize: 17, color: Colors.black)),
                                Icon(Icons.access_alarms_sharp),
                                Text('45', style: TextStyle(fontSize: 17, color: Colors.black))
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Số câu hỏi ", style: TextStyle(fontSize: 17, color: Colors.black)),
                                Icon(Icons.book_outlined),
                                Text('20', style: TextStyle(fontSize: 17, color: Colors.black)),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Trạng thái ", style: TextStyle(fontSize: 17, color: Colors.black)),
                                (quizResultState is QuizResultStateDone
                                ? const Icon(Icons.check_circle_outline, color: Colors.green)
                                : const Icon(Icons.cancel_outlined, color: Colors.red)),
                                (quizResultState is QuizResultStateDone
                                ? Text(quizResultState.result.toString(), style: const TextStyle(color: Colors.green))
                                : const Text('chưa hoàn thành', style: TextStyle(color: Colors.red)))
                              ],
                            ),
                            const SizedBox(height: 30),
                            TextButton(
                              onPressed: quizResulttate is! QuizResultStateDone
                                  ? () {
                                if (!StreamSocket.hasInit) {
                                  StreamSocket.init();
                                  BlocProvider.of<QuizBloc>(context).add(const QuizEventListen());
                                  StreamSocket.hasInit = true;
                                }
                                AppRouter.navigatorKey.currentState?.pushNamed(AppRoutes.quiz);
                                BlocProvider.of<QuizBloc>(context).add(
                                    QuizEventGetQuestion(
                                        lesson: 'lesson_${lessonsState.currentLesson}'
                                    )
                                );
                              }
                                  : () {},
                              child: Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Text("Bắt đầu", style: TextStyle(fontSize: 17, color: Colors.white)),
                                ),
                              ),
                            )
                          ]),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}

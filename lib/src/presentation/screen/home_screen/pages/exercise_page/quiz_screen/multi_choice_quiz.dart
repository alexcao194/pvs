import 'package:alex_core/alex_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/widget/question_box.dart';
import 'package:pvs/src/service/app_router.dart';

import '../../../../../../service/stream_socket.dart';
import '../../../../../bloc/data_bloc/data_bloc.dart';
import '../../../../../bloc/lessons_bloc/lessons_bloc.dart';
import 'bloc/quiz_result_bloc/quiz_result_bloc.dart';

class MultiChoiceQuiz extends StatefulWidget {
  const MultiChoiceQuiz({
    Key? key, required this.quiz, required this.answer1, required this.answer2, required this.answer3, required this.answer4, required this.page, required this.pageController, required this.totalQuestion,
  }) : super(key: key);

  final String quiz;
  final int page;
  final int totalQuestion;
  final PageController pageController;
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;

  @override
  State<MultiChoiceQuiz> createState() => _MultiChoiceQuizState();
}

class _MultiChoiceQuizState extends State<MultiChoiceQuiz> {

  int pickedAnswer = -1;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<LessonsBloc, LessonsState>(
      builder: (context, lessonsState) {
        return BlocBuilder<DataBloc, DataState>(
          builder: (context, dataState) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.08),
                    const Text('Chọn đáp án đúng',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: QuestionBox(
                        content: Center(
                          child: SingleChildScrollView(child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(widget.quiz),
                          )),
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
                            isActive: pickedAnswer == 0,
                            onTap: () {
                              setState(() {
                                pickedAnswer = 0;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(widget.answer1),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: InkWellButton(
                            height: size.height * 0.1,
                            backgroundColor: Colors.red,
                            primaryColor: Colors.red,
                            isActive: pickedAnswer == 1,
                            onTap: () {
                              setState(() {
                                pickedAnswer = 1;
                              });
                            },
                            radius: 10.0,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(widget.answer2),
                            ),
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
                            isActive: pickedAnswer == 2,
                            onTap: () {
                              setState(() {
                                pickedAnswer = 2;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(widget.answer3),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: InkWellButton(
                            height: size.height * 0.1,
                            backgroundColor: Colors.red,
                            primaryColor: Colors.red,
                            radius: 10.0,
                            isActive: pickedAnswer == 3,
                            onTap: () {
                              setState(() {
                                pickedAnswer = 3;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(widget.answer4),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(24.0),
                child: InkWellButton(
                  primaryColor: pickedAnswer != -1 ? Colors.red : Colors.black12,
                  height: 60,
                  radius: 10.0,
                  isActive: true,
                  onTap: pickedAnswer != -1 ? () {
                    StreamSocket.socket!.emit('submit', {
                      'id': dataState.user.id!,
                      'question': widget.page,
                      'answer': pickedAnswer,
                      'lesson': 'lesson_${lessonsState.pickedLesson}'
                    });
                    if (widget.totalQuestion == widget.pageController.page!.floor() + 1) {
                      AppRouter.navigatorKey.currentState?.pushReplacementNamed(AppRoutes.home);
                    } else {
                      widget.pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
                    }
                  } : null,
                  child: const Text('Submit', style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/bloc/quiz_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/multi_choice_quiz.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/widget/question_header_bar.dart';

enum QuizType {
  fillBank,
  mutilChoice,
}

class QuizScreen extends StatelessWidget {
  QuizScreen({Key? key}) : super(key: key);

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<QuizBloc, QuizState>(
            builder: (context, quizState) {
              return Stack(
                children: [
                  PageView.builder(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: quizState.quizs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MultiChoiceQuiz(
                        pageController: pageController,
                        totalQuestion: quizState.quizs.length,
                        page: index,
                        quiz: quizState.quizs[index]['question']!,
                        answer1: quizState.quizs[index]['answer-1']!,
                        answer2: quizState.quizs[index]['answer-2']!,
                        answer3: quizState.quizs[index]['answer-3']!,
                        answer4: quizState.quizs[index]['answer-4']!,
                      );
                    },
                  ),
                  const QuestionHeaderBar(),
                ],
              );
            }
        ));
  }
}

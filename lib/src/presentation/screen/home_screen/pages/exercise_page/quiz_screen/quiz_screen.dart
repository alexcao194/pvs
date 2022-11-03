import 'package:flutter/material.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/multi_choice_quiz.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/widget/question_header_bar.dart';

import '../../../../../../service/stream_socket.dart';

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
      body: Stack(
        children: [
          StreamBuilder(
            stream: StreamSocket.getResponse,
            initialData: const [
              {
                'question' : 'nodata',
                'answer-1' : 'nodata',
                'answer-2' : 'nodata',
                'answer-3' : 'nodata',
                'answer-4' : 'nodata'
              }
            ],
            builder: (BuildContext context, AsyncSnapshot<List<Map<String, String>>> snapshot) {
              if(snapshot.data != null) {
                return PageView.builder(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MultiChoiceQuiz(
                      pageController: pageController,
                      totalQuestion: snapshot.data!.length,
                      page: index,
                      quiz: snapshot.data![index]['question']!,
                      answer1: snapshot.data![index]['answer-1']!,
                      answer2: snapshot.data![index]['answer-2']!,
                      answer3: snapshot.data![index]['answer-3']!,
                      answer4: snapshot.data![index]['answer-4']!,
                    );
                  },
                );
              } else {
                return const Center(child: Text('no data'));
              }
            },
          ),
          const QuestionHeaderBar(),
        ],
      ),
    );
  }
}

